# Maintainer: Michal Krenek (Mikos) <m.krenek@gmail.com>

pkgname=soapyhackrf-git
pkgver=r51.051ad65
pkgrel=1
epoch=2
pkgdesc="SoapySDR plugin for HackRF"
arch=('any')
url="https://github.com/pothosware/SoapyHackRF"
license=('GPLv3')
depends=('soapysdr' 'hackrf')
makedepends=('git')
provides=('soapyhackrf')
conflicts=('soapyhackrf')
source=(${pkgname}::"git+https://github.com/pothosware/SoapyHackRF.git")
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
