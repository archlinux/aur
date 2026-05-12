pkgname=wsjtz
pkgver=2.0.14
pkgrel=1
pkgdesc="Fork of WSJT-X with automation features"
arch=('i686' 'x86_64' 'aarch64')
url="https://github.com/sq9fve/wsjt-z"
license=('GPL-3')
makedepends=(cmake asciidoc asciidoctor boost dos2unix git)
options=('!lto')
depends=(hamlib qt5-base qt5-multimedia qt5-serialport qt5-tools libusb libusb-compat gcc-fortran libpulse libpng fftw)
provides=(wsjtx)
conflicts=(wsjtx)
source=(https://codeload.github.com/sq9fve/wsjt-z/tar.gz/refs/tags/v$pkgver)
sha512sums=('SKIP')

prepare() {
    mkdir -p $srcdir/build
    tar -C $srcdir/build/ -xvf v$pkgver
}

build() {
    cd $srcdir/build
    cmake -Wno-dev -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Release $srcdir/wsjtx
    make || return 1
}

package() {
    cd "${srcdir}/build"
    make DESTDIR="${pkgdir}" install
}
