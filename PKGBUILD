# Maintainer: Janne Heß <jannehess@gmail.com>

pkgname=archivemount
pkgver=0.8.12
pkgrel=1
pkgdesc="FUSE filesystem using libarchive"
url="http://www.cybernoia.de/software/${pkgname}/"
license=("GPL2")
depends=("fuse" "libarchive")
makedepends=("make")
conflicts=("${pkgname}-git")
source=("http://www.cybernoia.de/software/${pkgname}/${pkgname}-${pkgver}.tar.gz")
sha512sums=('4ce9e7ec8585b07d5bf48df41cc4a1b4ba7fe2268864ec70c445a6b9c21237f267a19814f00c5ef5a940a90ebaa47c9626aff1dbbff6fbb22e2c260da666ccd9')
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

