# Maintainer: Marcel Röthke <marcel.roethke@haw-hamburg.de>
# Contributor: Mirco Tischler <mt-ml at gmx dot de>

pkgname=actor-framework
pkgver=0.19.3
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
	"git+https://github.com/actor-framework/actor-framework#commit=f2d63e9cce6452fdb4a62e70ae94235423e09c73"
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
