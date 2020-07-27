# Maintainer: Marcel Röthke <marcel.roethke@haw-hamburg.de>
# Contributor: Mirco Tischler <mt-ml at gmx dot de>

pkgname=actor-framework
pkgver=0.17.6
pkgrel=2
pkgdesc="An Open Source Implementation of the Actor Model in C++"
arch=(i686 x86_64)
url="http://actor-framework.org"
license=('custom:"BSD-3-Clause"'
	 'custom:"Boost Software License"')
depends=()
makedepends=('cmake' 'opencl-headers' 'git' 'python' 'opencl-icd-loader')
optdepends=(
	'opencl-icd-loader: opencl support'
	'openssl: openssl support'
	)

source=(
	"git+https://github.com/actor-framework/actor-framework#commit=f7d4fc7ac679e18ba385f64434f8015c3cea9cb5"
	)
sha256sums=('SKIP')

prepare(){
	cd ${pkgname}

	LDFLAGS=$LDFLAGS CXXFLAGS=$CXXFLAGS \
		./configure   \
		--prefix=/usr \
		--no-examples
}

build() {
	cd ${pkgname}/build
	make
}

check() {
	cd ${pkgname}/build
	make test
}

package() {
	cd ${pkgname}/build
	make DESTDIR="${pkgdir}" install

	cd ..
	install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	install -D -m644 LICENSE_ALTERNATIVE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE_ALTERNATIVE"
}
