# Maintainer: Dana Sorensen <dana.r.sorensen@gmail.com>

pkgname=soapyplutosdr-git
pkgver=r23.dd6686e
pkgrel=1
pkgdesc="Soapy SDR plugin for PlutoSDR"
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
url="https://github.com/jocover/SoapyPlutoSDR"
license=('LGPL2.1')
depends=('soapysdr-git' 'libad9361-iio-git')
makedepends=('git' 'cmake')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("${pkgname%-git}::git+https://github.com/jocover/SoapyPlutoSDR.git")
md5sums=('SKIP')

pkgver() {
    cd "$srcdir/${pkgname%-git}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
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
