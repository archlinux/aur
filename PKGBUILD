# Maintainer: Michal Krenek (Mikos) <m.krenek@gmail.com>

pkgname=soapyosmo-git
pkgver=r66.60b496d
pkgrel=1
epoch=2
pkgdesc="SoapySDR plugins for OsmoSDR devices (Airspy, Airspy Mini, MiriSDR, RFSpace)"
arch=('any')
url="https://github.com/pothosware/SoapyOsmo"
license=('GPLv3')
depends=('soapysdr' 'gnuradio-osmosdr' 'libmirisdr-git')
makedepends=('git')
provides=('soapyosmo')
conflicts=('soapyosmo')
source=(${pkgname}::"git+https://github.com/pothosware/SoapyOsmo.git")
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
