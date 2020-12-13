# Maintainer:  <reg-archlinux AT klein DOT tuxli DOT ch> 

pkgname=openkropki
pkgver=0.4
pkgrel=1
pkgdesc='OpenKropki is an open-source and multiplatform implementation of the kropki game. It runs on most POSIX systems. MIT license.'
url='http://openkropki.sourceforge.net/'
license=('MIT')
arch=('x86_64' 'aarch64')
conflicts=(openkropki-svn)
depends=('sdl2_ttf' 'sdl2' 'zlib')
makedepends=('tar' 'make' 'gcc' 'sed') 
source=("http://openkropki.sourceforge.net/archiwum/openkropki-${pkgver}.tar.xz")
sha512sums=('1e62fec32de2dd51eadae133449d95aa6ebdaa9afc4ad7f95fa3255a3e0b88895bb1485030993c95df730b67cc6d08ca08df805abd3f09b4431d09f87c0a6149')

build() {
	cd ${srcdir}"/"${pkgname}"-"${pkgver}
	make 
}

prepare() {
	cd ${srcdir}"/"${pkgname}"-"${pkgver}
	sed -n '/.*MIT\ License.*/,$p' openkropki.txt > LICENSE
}

package() {
	mkdir -p "${pkgdir}/usr/bin/"
	cd ${srcdir}"/"${pkgname}"-"${pkgver}
	mv openkropki	${pkgdir}/usr/bin/
	install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
