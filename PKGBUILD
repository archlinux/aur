# Maintainer: AI5C <ai5c@ai5c.com>
pkgname=wsjtx-beta
pkgver=2.6.0
pkgrel=1
pkgdesc="Software for Amateur Radio Weak-Signal Communication (JT9 and JT65)"
arch=('i686' 'x86_64' 'aarch64')
url="http://physics.princeton.edu/pulsar/k1jt/wsjtx.html"
license=('GPL-3')
makedepends=(cmake asciidoc asciidoctor boost git)
depends=(qt5-base qt5-multimedia qt5-serialport qt5-tools libusb libusb-compat gcc-fortran libpulse libpng fftw)
conflicts=(wsjtx)
source=(http://downloads.sourceforge.net/sourceforge/wsjt/$pkgname-$pkgver-rc5.tgz)
sha512sums=('a5968c74532731e80973160c57348d4efd7d47e3861e797e486fbb3507dce0a5f3f26a8ba83d3a227310b88b5105e500c7b4c04741ed6a7689aef07827cb71e8')

build() {
    mkdir -p $srcdir/build
    cd $srcdir/build
    cmake -Wno-dev -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Release $srcdir/$pkgname-$pkgver
    make || return 1
}

package() {
    cd "${srcdir}/build"
    make DESTDIR="${pkgdir}" install
}
