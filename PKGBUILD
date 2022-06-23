pkgname=wsjtx
pkgver=2.5.4
pkgrel=2
pkgdesc="Software for Amateur Radio Weak-Signal Communication (JT9 and JT65)"
arch=('i686' 'x86_64' 'aarch64')
url="http://physics.princeton.edu/pulsar/k1jt/wsjtx.html"
license=('GPL-3')
makedepends=(cmake asciidoc asciidoctor boost git)
depends=(qt5-base qt5-multimedia qt5-serialport qt5-tools libusb libusb-compat gcc-fortran libpulse libpng fftw)
source=(http://physics.princeton.edu/pulsar/K1JT/$pkgname-$pkgver.tgz)
sha512sums=('c4092d03af3346f0244d942c3db693f5d2c1ed7a2ec9077ded039b7d162e15abdaf09dcb9997d1833d25c366eb03a0dab6114313d423e7e2c9ff37d965261efc')

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
