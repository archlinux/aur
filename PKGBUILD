# Maintainer: Masoud <mpoloton@gmail.com>
# Contributor: valvetime <valvetimepackages@gmail.com>
# Contributor: Tom Swartz <tom@tswartz.net>

pkgname=soapyrtlsdr-git
pkgver=0.2.2.r3.g12aa0a2
pkgrel=1
epoch=3
pkgdesc="SoapySDR RTL-SDR Support Module"
arch=('any')
url="https://github.com/pothosware/SoapySDR"
license=('MIT')
depends=('soapysdr' 'rtl-sdr')
makedepends=('git' 'cmake')
provides=('soapyrtlsdr')
conflicts=('soapyrtlsdr')
source=(${pkgname}::"git+https://github.com/pothosware/SoapyRTLSDR.git")
sha256sums=('SKIP')

pkgver() {
  cd "$pkgname"
  git describe --long | sed 's/^soapy.rtlsdr-//;s/\([^-]*-g\)/r\1/;s/-/./g' 
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

        # install the license
	mkdir -p "$pkgdir/usr/share/licenses/soapyrtlsdr-git"
	cp "$srcdir/soapyrtlsdr-git/LICENSE.txt" "$pkgdir/usr/share/licenses/soapyrtlsdr-git/"
}

