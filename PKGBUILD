# Maintainer: Manuel Hüsers <manuel.huesers@uni-ol.de>
# Contributor: Jose Riha <jose1711 gmail com>
# Contributor: archtux <antonio dot arias99999 at gmail dot com>

pkgname=bino
pkgver=1.6.5
pkgrel=1
pkgdesc='3D video player with multi-display support'
arch=('i686' 'x86_64')
url='https://bino3d.org/'
license=('GPL3')
depends=('ffmpeg' 'freealut' 'freeglut' 'glewmx' 'libass' 'qt5-base')
optdepends=('lirc: infrared remote control')
source=(https://download.savannah.gnu.org/releases/$pkgname/$pkgname-$pkgver.tar.xz{,.sig}
	'gui_common.h')
sha512sums=('8be28ad2febbbf631d57ee0c32457ac2ba1f90bafcbbce83933fc5ac487e8e9aab8edcb8ed6127c5bee02ddea0dc5150743350a4289a3b9758f50562034a92c4'
	'SKIP'
	'8006b07a72f964da78a9ba3df7c4ead522cdca0303ab1c1d9b8224a6dd062f24e0bccf95146656e28c5ba3baa8dbc2e513309adb7486e26f1d3563eec35d0325')
validpgpkeys=('2F788CDEF4181652720EF132F4926138953E5294')

prepare() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	sed -i 's/CXXFLAGS -fPIE/& -fPIC/' configure
	./configure --prefix=/usr \
	            --with-qt-version=5 \
	            #--with-xnvctrl # Enable NVIDIA Quadro SDI output
}

build() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	cp '../gui_common.h' 'src'
	make
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	make DESTDIR="${pkgdir}" install
}
