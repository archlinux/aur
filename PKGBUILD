# Maintainer: Thomas Gatzweiler <thomas.gatzweiler@gmail.com>

pkgname=wsjtx
pkgver=1.6.0
pkgrel=1
pkgdesc="Software for Amateur Radio Weak-Signal Communication (JT9 and JT65)"
arch=('i686' 'x86_64')
url="http://physics.princeton.edu/pulsar/k1jt/wsjtx.html"
license=('GPL-3')
makedepends=(cmake asciidoc)
depends=(qt5-base qt5-multimedia qt5-serialport libusb libusb-compat gcc-fortran libpulse libpng kvasd-bin)
source=(http://physics.princeton.edu/pulsar/K1JT/$pkgname-$pkgver.tgz)
md5sums=('a2c504f7ccdae52961668f0e85f59ad3')

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
