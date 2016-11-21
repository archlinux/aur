# Maintainer: Joermungand <joermungand at gmail dot com>

pkgname=infamousplugins-git
pkgver=0.2.02.r8.gfca606f
pkgrel=1
pkgdesc="A collection of open-source LV2 plugins"
arch=('i686' 'x86_64')
url="http://infamousplugins.sourceforge.net"
license=('GPL2')
groups=('lv2-plugins')
depends=('fftw' 'ntk' 'zita-resampler')
makedepends=('git' 'cmake' 'lv2')
provides=('infamousplugins')
conflicts=('infamousplugins')
source=("${pkgname%-*}"::'git://github.com/ssj71/infamousPlugins.git')
md5sums=('SKIP')

pkgver() {
    cd "$srcdir/${pkgname%-*}"
    git describe --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd "$srcdir/${pkgname%-*}"
	mkdir build
	cd build
	cmake -DCMAKE_INSTALL_PREFIX:PATH=/usr ..
	make
}

package() {
    cd "$srcdir/${pkgname%-*}/build"
	make DESTDIR="$pkgdir/" install
	cd ..
    install -Dm644 CHANGELOG "$pkgdir/usr/share/doc/${pkgname%-*}/CHANGELOG"
    install -Dm644 COPYING "$pkgdir/usr/share/doc/${pkgname%-*}/COPYING"
    install -Dm644 README  "$pkgdir/usr/share/doc/${pkgname%-*}/README"
}

