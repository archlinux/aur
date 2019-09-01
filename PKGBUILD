# Maintainer: Dana Sorensen <dana.r.sorensen@gmail.com>

pkgname=soapyplutosdr-git
pkgver=0.2.0.r2.ge28e4f5
pkgrel=1
pkgdesc="Soapy SDR plugin for PlutoSDR"
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
url="https://github.com/pothosware/SoapyPlutoSDR"
license=('LGPL2.1')
depends=('soapysdr' 'libad9361-iio-git')
makedepends=('git' 'cmake')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("${pkgname%-git}::git+https://github.com/pothosware/SoapyPlutoSDR.git")
md5sums=('SKIP')

pkgver() {
    cd "$srcdir/${pkgname%-git}"
    git describe --long | sed 's/^soapy-plutosdr-//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd "$srcdir/${pkgname%-git}"
    mkdir -p build
    cd build
    cmake .. -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr
    make
}

package() {
    cd "$srcdir/${pkgname%-git}/build"
    make DESTDIR="$pkgdir/" install
}
