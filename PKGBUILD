# Maintainer:  <reg-archlinux AT klein DOT tuxli DOT ch> 

pkgname=sais
pkgver=1.6.3
pkgrel=2
pkgdesc='Strange Adventures In Infinite Space is a roguelike video game created by the indie developer Digital Eel'
url='http://digital-eel.com/sais/'
license=('GPL3')
arch=('x86_64' 'aarch64')
depends=('physfs' 'sdl2_mixer')
makedepends=('cmake' 'git' 'sdl2' 'sdl2_mixer')
source=("https://github.com/kuroneko/sais/archive/v${pkgver}.tar.gz")
sha512sums=('99ca8de25caf9d2dd62afd4a67a4d811feccc5dab0c0767a864f3eb70bb495c8b580bbd683f5d7261337750eddb8556de75a893386032e01049b86168b8072e8')

build() {
	cd ${srcdir}"/"${pkgname}"-"${pkgver}
	cmake -DCMAKE_INSTALL_PREFIX="${pkgdir}/opt/${pkgname}/" .
	make all
}

package() {
	mkdir -p "${pkgdir}/usr/bin/"
	mkdir -p "${pkgdir}/opt/${pkgname}/"
	cd ${srcdir}"/"${pkgname}"-"${pkgver}
	make install
	ln -s "/opt/sais/strange" "${pkgdir}/usr/bin/strange"
	ln -s "/opt/sais/strange" "${pkgdir}/usr/bin/sais"
	install -Dm644 "${srcdir}/${pkgname}-${pkgver}/COPYING.md" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
