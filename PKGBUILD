# Maintainer: Manuel Hüsers <manuel.huesers@uni-ol.de>
# Contributor: Jose Riha <jose1711 gmail com>
# Contributor: archtux <antonio dot arias99999 at gmail dot com>

pkgname=bino
pkgver=1.6.6
pkgrel=1
pkgdesc='3D video player with multi-display support'
arch=('i686' 'x86_64')
url='https://bino3d.org/'
license=('GPL3')
depends=('ffmpeg' 'freealut' 'freeglut' 'glewmx' 'libass' 'qt5-base')
optdepends=('lirc: infrared remote control')
source=(https://download.savannah.gnu.org/releases/$pkgname/$pkgname-$pkgver.tar.xz{,.sig}
	'gui_common.h')
sha512sums=('43a17f390881fcc8b7721b21ff8524b89992cd7fb0cfc467769bdddd0ad0c0d2536d161475a7fce6d4d3e758e017a38f671648dfaa4a345dc02127b7b192c8c0'
	'SKIP'
	'8006b07a72f964da78a9ba3df7c4ead522cdca0303ab1c1d9b8224a6dd062f24e0bccf95146656e28c5ba3baa8dbc2e513309adb7486e26f1d3563eec35d0325')
validpgpkeys=('2F61B4828BBA779AECB3F32703A2A4AB1E32FD34')

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
