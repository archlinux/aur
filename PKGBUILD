# Maintainer: valvetime <valvetimepackages@gmail.com>
# Contributor: Tom Swartz <tom@tswartz.net>

pkgname=soapyrtlsdr-git
pkgver=r53.a44abc3
pkgrel=1
epoch=2
pkgdesc="SoapySDR RTL-SDR Support Module"
arch=('any')
url="https://github.com/pothosware/SoapySDR"
license=('MIT')
depends=('soapysdr' 'rtl-sdr')
makedepends=('git')
provides=('soapyrtlsdr')
conflicts=('soapyrtlsdr')
source=(${pkgname}::"git+https://github.com/pothosware/SoapyRTLSDR.git")
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

