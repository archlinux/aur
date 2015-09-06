# Maintainer: Janne Heß <jannehess@gmail.com>

# Contributor: Janne Heß <jannehess@gmail.com>

pkgname=archivemount
pkgver=0.8.5
pkgrel=1
pkgdesc="FUSE filesystem using libarchive"
url="http://www.cybernoia.de/software/archivemount/"
license=("GPL2")
depends=("fuse" "libarchive")
makedepends=("automake" "autoconf")
conflicts=("archivemount-git")
source=("http://www.cybernoia.de/software/${pkgname}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('3c919fc46077a0f458cb52454d72c34f1cefda4e2a4e6c987a5156458f144f79')
arch=("i686" "x86_64")

build() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	aclocal
	autoheader
	automake
	autoconf
	./configure
	make
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	install -Dm755 "${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
	make PREFIX="/usr" DESTDIR="${pkgdir}/" install-man
	mv "${pkgdir}/usr/local/share" "${pkgdir}/usr"
	rmdir "${pkgdir}/usr/local"
}

