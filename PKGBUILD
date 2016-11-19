# Maintainer: Joermungand <joermungand at gmail dot com>

pkgname=infamousplugins-git
pkgver=602.fca606f
pkgrel=1
pkgdesc="A collection of open-source LV2 plugins"
arch=('i686' 'x86_64')
url="http://infamousplugins.sourceforge.net"
license=('GPL2')
groups=('lv2-plugins')
depends=('glibc' 'fftw')
makedepends=('git' 'qt4' 'lv2')
provides=('infamousplugins')
conflicts=('infamousplugins')
source=("${pkgname%-*}-code"::'git://github.com/ssj71/infamousPlugins.git')
md5sums=('SKIP')
_plugins="CellularAutomatonSynth EnvelopeFollower Hip2B Stuck PowerCut PowerUp EWham"

pkgver() {
    cd "$srcdir/${pkgname%-*}-code"
    echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

build() {
    cd "$srcdir/${pkgname%-*}-code"
	mkdir build
	cd build
	cmake -DCMAKE_INSTALL_PREFIX=/usr -DINSTALL_PREFIX=/usr ..
	make
}

package() {
    cd "$srcdir/${pkgname%-*}-code/build"
	make DESTDIR="$pkgdir/" install
}

