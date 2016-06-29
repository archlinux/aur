# Maintainer: Janne Heß <jannehess@gmail.com>

pkgname=archivemount
pkgver=0.8.7
pkgrel=1
pkgdesc="FUSE filesystem using libarchive"
url="http://www.cybernoia.de/software/${pkgname}/"
license=("GPL2")
depends=("fuse" "libarchive")
makedepends=("automake" "autoconf" "make")
conflicts=("${pkgname}-git")
source=("http://www.cybernoia.de/software/${pkgname}/${pkgname}-${pkgver}.tar.gz")
sha512sums=('8869786b7fe6ef12eef2150c42a4e152e033a9387383a689a4e9ab4ead7548c11f9db8f19c62ef55ab858a6387b02af59741f39de3d600aee08ed4ddd0afe7c1')
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

