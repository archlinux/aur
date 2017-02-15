# Maintainer: Michal Krenek (Mikos) <m.krenek@gmail.com>

pkgname=soapyairspy-git
pkgver=r18.e206492
pkgrel=1
epoch=2
pkgdesc="SoapySDR plugin for Airspy R2 and Airspy Mini"
arch=('any')
url="https://github.com/pothosware/SoapyAirspy"
license=('MIT')
depends=('soapysdr' 'airspy')
makedepends=('git')
provides=('soapyairspy')
conflicts=('soapyairspy')
source=(${pkgname}::"git+https://github.com/pothosware/SoapyAirspy.git")
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
