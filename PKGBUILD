# Maintainer: valvetime <valvetimepackages@gmail.com>
# Contributor: Tom Swartz <tom@tswartz.net>

pkgname=soapysdr-git
pkgver=r333.ddbca72
pkgrel=1
epoch=2
pkgdesc="Vendor and platform neutral SDR support library"
arch=('any')
url="https://github.com/pothosware/SoapySDR"
license=('custom:Boost Software License Version 1.0')
provides=('soapysdr')
conflicts=('soapysdr')
makedepends=('git')
source=(${pkgname}::"git+https://github.com/pothosware/SoapySDR.git")
sha256sums=('SKIP')


build() {
	cd "${srcdir}/${pkgname}"
	mkdir -p build
	cd build
	cmake .. -DCMAKE_BUILD_TYPE=Release
	make -j4
}


pkgver() {
  cd "$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}


package() {
	make -C "${srcdir}/${pkgname}/build" DESTDIR="${pkgdir}" install

#install the license
	mkdir -p "$pkgdir/usr/share/licenses/soapysdr-git"
	cp "$srcdir/soapysdr-git/LICENSE_1_0.txt" "$pkgdir/usr/share/licenses/soapysdr-git/"
}
