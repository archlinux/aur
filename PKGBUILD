pkgname=wsjtz
pkgver=2.5.4
pkgrel=1.22
pkgdesc="Fork of WSJT-X with automation features"
arch=('i686' 'x86_64' 'aarch64')
url="https://sourceforge.net/projects/wsjt-z/"
license=('GPL-3')
makedepends=(cmake asciidoc asciidoctor boost git)
depends=(hamlib qt5-base qt5-multimedia qt5-serialport qt5-tools libusb libusb-compat gcc-fortran libpulse libpng fftw)
provides=(wsjtx)
conflicts=(wsjtx)
source=(https://netcologne.dl.sourceforge.net/project/wsjt-z/Source/wsjtz-$pkgver-$pkgrel.zip)
sha512sums=('SKIP')

build() {
    mkdir -p $srcdir/build
    cd $srcdir/build
    cmake -Wno-dev -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Release $srcdir/wsjtx
    make || return 1
}

package() {
    cd "${srcdir}/build"
    make DESTDIR="${pkgdir}" install
}
