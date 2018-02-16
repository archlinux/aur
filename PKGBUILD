# Maintainer: Dana Sorensen <dana.r.sorensen@gmail.com>

pkgname=rx_tools-git
pkgver=v1.0.3.r5.571cc9a
pkgrel=1
pkgdesc="rx_fm, rx_power, and rx_sdr tools for receiving data from SDRs, using the SoapySDR vendor-neutral SDR support library"
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
url="https://github.com/rxseger/rx_tools"
license=('GPL2')
depends=('glibc' 'soapysdr')
makedepends=('git' 'cmake')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("git+$url.git")
md5sums=('SKIP')

pkgver() {
    cd "$srcdir/${pkgname%-git}"
    git describe --long --tags | sed 's/\([^-]*-\)g/r\1/;s/-/./g'
}

build() {
    cd "$srcdir/${pkgname%-git}"
    cmake -DCMAKE_INSTALL_PREFIX=/usr
    make
}

package() {
    cd "$srcdir/${pkgname%-git}"
    make DESTDIR="$pkgdir/" install
}

