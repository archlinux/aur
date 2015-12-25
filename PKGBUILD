# Maintainer: valvetime <valvetimepackages@gmail.com>
# Contributor: Tom Swartz <tom@tswartz.net>

pkgname=soapysdr-git
pkgver=20151225
pkgrel=1
pkgdesc="Vendor and platform neutral SDR support library"
arch=('any')
url="https://github.com/pothosware/SoapySDR"
license=('custom:Boost Software License Version 1.0')
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

package() {
	make -C "${srcdir}/${pkgname}/build" DESTDIR="${pkgdir}" install

#install the license
	mkdir -p "$pkgdir/usr/share/licenses/soapysdr-git"
	cp "$srcdir/soapysdr-git/LICENSE_1_0.txt" "$pkgdir/usr/share/licenses/soapysdr-git/"
}
