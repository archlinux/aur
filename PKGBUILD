pkgname=soapyremote-git
pkgver=0.2.0.r0.g71f7183
pkgrel=1
provides=('soapyremote')
pkgdesc="Use any Soapy SDR remotely"
arch=('any')
url="https://github.com/pothosware/SoapyRemote"
license=('custom:Boost Software License Version 1.0')
makedepends=('git' 'soapysdr-git')
source=(${pkgname}::"git+https://github.com/pothosware/SoapyRemote.git")
sha256sums=('SKIP')


build() {
	cd "${srcdir}/${pkgname}"
	mkdir -p build
	cd build
	cmake .. -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr
	make
}


pkgver() {
  git -C "$pkgname" describe --long | sed 's/soapy-remote-//;s/\([^-]*-g\)/r\1/;s/-/./g'
}


package() {
	make -C "${srcdir}/${pkgname}/build" DESTDIR="${pkgdir}" install
	install -D -t "$pkgdir/usr/share/licenses/${pkgname}/" "${srcdir}/${pkgname}/LICENSE_1_0.txt"
}
