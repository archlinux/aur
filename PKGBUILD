# Maintainer: Karel <karelparlin@gmail.com>

pkgname=soapybladerf-git
pkgver=r82.4fa4566
pkgrel=1
pkgdesc="SoapySDR plugin for BladeRF"
arch=('i686' 'x86_64')
url="https://github.com/pothosware/SoapyBladeRF"
license=('LGPLv2')
depends=('soapysdr' 'bladerf')
makedepends=('cmake' 'git')
provides=('soapybladerf')
conflicts=('soapybladerf')
source=(${pkgname}::"git+https://github.com/pothosware/SoapyBladeRF.git")
sha256sums=('SKIP')

pkgver() {
    cd "$pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "${srcdir}/${pkgname}"
    mkdir -p build
    cd build
    cmake .. -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr
    make
}

package() {
    make -C "${srcdir}/${pkgname}/build" DESTDIR="${pkgdir}" install
}
