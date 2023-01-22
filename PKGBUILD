pkgname=wsjtx
pkgver=2.6.1
pkgrel=1
pkgdesc="Software for Amateur Radio Weak-Signal Communication (JT9 and JT65)"
arch=('i686' 'x86_64' 'aarch64')
url="http://physics.princeton.edu/pulsar/k1jt/wsjtx.html"
license=('GPL-3')
makedepends=(cmake asciidoc asciidoctor boost git)
depends=(qt5-base qt5-multimedia qt5-serialport qt5-tools libusb libusb-compat gcc-fortran libpulse libpng fftw)
# source=(http://physics.princeton.edu/pulsar/K1JT/$pkgname-$pkgver.tgz)
source=(http://downloads.sourceforge.net/sourceforge/wsjt/$pkgname-$pkgver.tgz)
sha512sums=('0f151c10b75798ab28a01604b08981f399d612135b7e9ddc3e66f9121fd49c97bb9508ce649e342791705ee5e1247f8e461a31afa871ddd46da1cf7fd5826c74')

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
