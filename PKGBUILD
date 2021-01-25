# Maintainer: Marcel Röthke <marcel.roethke@haw-hamburg.de>
# Contributor: Mirco Tischler <mt-ml at gmx dot de>

pkgname=actor-framework
pkgver=0.18.0
pkgrel=1
pkgdesc="An Open Source Implementation of the Actor Model in C++"
arch=(i686 x86_64)
url="http://actor-framework.org"
license=('custom:"BSD-3-Clause"')
depends=('gcc-libs')
makedepends=('cmake' 'git')
optdepends=(
	'openssl: openssl support'
	)

source=(
	"git+https://github.com/actor-framework/actor-framework#commit=212a9e77475e181cb281eefe95606f19bc2e27d9"
	)
sha256sums=('SKIP')

prepare(){
	cd ${pkgname}

	LDFLAGS=$LDFLAGS CXXFLAGS=$CXXFLAGS \
		./configure   \
		--prefix=/usr \
		--disable-examples
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
}
