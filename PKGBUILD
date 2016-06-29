# Maintainer: Janne Heß <jannehess@gmail.com>

pkgname=archivemount-git
pkgver=0.8.7.gbb2faa8
pkgrel=1
pkgdesc="FUSE filesystem using libarchive"
url="http://www.cybernoi.de/software/${pkgname%-git}/"
license=("GPL2")
depends=("fuse" "libarchive")
makedepends=("automake" "autoconf" "make")
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("${pkgname}::git+http://www.cybernoia.de/software/${pkgname%-git}/git")
sha512sums=('SKIP')
arch=("i686" "x86_64")

pkgver() {
	cd "${pkgname}"
	git describe --tags --always | sed 's/-[[:digit:]]*-/./g'
}

build() {
	cd "${pkgname}"
	aclocal
	autoheader
	automake --add-missing
	autoconf
	./configure
	make
}

package() {
	cd "${pkgname}"
	install -Dm755 "${pkgname%-git}" "${pkgdir}/usr/bin/${pkgname%-git}"
	make PREFIX="/usr" DESTDIR="${pkgdir}/" install-man
	mv "${pkgdir}/usr/local/share" "${pkgdir}/usr"
	rmdir "${pkgdir}/usr/local"
}

