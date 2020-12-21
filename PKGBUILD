# Maintainer: Konrad Beckmann <konrad.beckmann@gmail.com>

pkgname=soapyairspyhf-git
pkgver=r28.b6cfbf5
pkgrel=1
epoch=2
pkgdesc="SoapySDR plugin for Airspy HF+"
arch=('any')
url="https://github.com/pothosware/SoapyAirspyHF"
license=('MIT')
depends=('soapysdr' 'airspyhf')
makedepends=('git' 'cmake' 'make' 'gcc' 'pkgconfig')
provides=('soapyairspyhf')
conflicts=('soapyairspyhf')
source=(${pkgname}::"git+https://github.com/pothosware/SoapyAirspyHF.git")
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

