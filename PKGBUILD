# Maintainer: karel <karelparlin at gmail dot com>

pkgname=soapybladerf-git
pkgver=r63.9a0cb72
pkgrel=1
epoch=2
pkgdesc="SoapySDR plugin for BladeRF"
arch=('any')
url="https://github.com/pothosware/SoapyBladeRF"
license=('GPLv3')
depends=('soapysdr' 'bladerf')
makedepends=('git')
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
        make -j4
}

package() {
        make -C "${srcdir}/${pkgname}/build" DESTDIR="${pkgdir}" install
}
