pkgname=wsjtx
pkgver=2.5.3
pkgrel=1
pkgdesc="Software for Amateur Radio Weak-Signal Communication (JT9 and JT65)"
arch=('i686' 'x86_64')
url="http://physics.princeton.edu/pulsar/k1jt/wsjtx.html"
license=('GPL-3')
makedepends=(cmake asciidoc asciidoctor boost)
depends=(qt5-base qt5-multimedia qt5-serialport qt5-tools libusb libusb-compat gcc-fortran libpulse libpng fftw)
source=(http://physics.princeton.edu/pulsar/K1JT/$pkgname-$pkgver.tgz)
sha512sums=('ed6664223069c7b44dac8c995b4beaa96e2a839a9049e5805d93b1f0ffe03d310b7a301150d693fcc22f96a97ed86c4948059f1e18b23cd2c9a5e44665100862')

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
