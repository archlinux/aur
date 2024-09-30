# Maintainer: AI5C <ai5c@ai5c.com>
pkgname=wsjtx-beta
pkgver=2.7.0
pkgrel=1
pkgdesc="Software for Amateur Radio Weak-Signal Communication (JT9 and JT65)"
arch=('i686' 'x86_64' 'aarch64')
url="http://physics.princeton.edu/pulsar/k1jt/wsjtx.html"
license=('GPL-3')
makedepends=(cmake asciidoc asciidoctor boost git)
depends=(qt5-base qt5-multimedia qt5-serialport qt5-tools libusb libusb-compat gcc-fortran libpulse libpng fftw)
provides=("${pkgname%-beta}")
conflicts=("${pkgname%-beta}")
source=(http://downloads.sourceforge.net/sourceforge/wsjt/wsjtx-$pkgver-rc7.tgz)
sha512sums=('fd930d6e7f39238e02b540c3839c28a5ab3b9b99a7bfe081ff583d5d78633e3a8c8dbf559b73e4e370f950e90eb654882e257062a02a8ba99540f77de70684c2')

build() {
    mkdir -p $srcdir/build
    cd $srcdir/build
    cmake -Wno-dev -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Release $srcdir/"${pkgname%-beta}"-$pkgver
    make || return 1
}

package() {
    cd "${srcdir}/build"
    make DESTDIR="${pkgdir}" install
}
