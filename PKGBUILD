# Maintainer: Michal Krenek (Mikos) <m.krenek@gmail.com>
pkgname=rtl_power_fftw-git
_pkgname=rtl-power-fftw
pkgver=r129.b14d624
pkgrel=1
pkgdesc="Power spectrum for RTLSDR dongles"
arch=('i686' 'x86_64')
url="https://github.com/AD-Vega/rtl-power-fftw"
license=('GPL')
groups=()
depends=('rtl-sdr' 'tclap' 'fftw')
makedepends=('git' 'cmake')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('git+https://github.com/AD-Vega/rtl-power-fftw.git')
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/${_pkgname}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "$srcdir/${_pkgname}"
    mkdir build && cd build
    cmake .. \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr
    make
}

package() {
    cd "$srcdir/${_pkgname}/build"
    make DESTDIR="$pkgdir/" install
}
