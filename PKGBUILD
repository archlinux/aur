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
source=(https://download.savannah.gnu.org/releases/$pkgname/$pkgname-$pkgver.tar.xz
	'gui_common.h')
sha256sums=('3254316d3ae81cc69643dcd823caaac1233704d91289272d0011ced5e5cdffe2'
	'0664e447fe115dbe7a146f3d057f171731c082cbc5691b68e2c959205a39c4e5')
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
