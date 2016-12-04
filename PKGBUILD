# Maintainer: Masoud <mpoloton@gmail.com>
# Contributor: valvetime <valvetimepackages@gmail.com>
# Contributor: Tom Swartz <tom@tswartz.net>

pkgname=soapysdr-git
pkgver=0.5.4.r32.ga412ad4
pkgrel=1
epoch=3
pkgdesc="Vendor and platform neutral SDR support library"
arch=('any')
url="https://github.com/pothosware/SoapySDR"
license=('custom:Boost Software License Version 1.0')
provides=('soapysdr')
conflicts=('soapysdr')
makedepends=('git' 'cmake')
depends=()
optdepends=('swig' 'python') 
source=(${pkgname}::"git+https://github.com/pothosware/SoapySDR.git")
sha256sums=('SKIP')

pkgver() {
  cd "$pkgname"
  git describe --long | sed 's/^soapy.sdr-//;s/\([^-]*-g\)/r\1/;s/-/./g'
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

        #install the license
	mkdir -p "$pkgdir/usr/share/licenses/soapysdr-git"
	cp "$srcdir/soapysdr-git/LICENSE_1_0.txt" "$pkgdir/usr/share/licenses/soapysdr-git/"
}
