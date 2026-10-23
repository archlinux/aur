# Maintainer: Marcel Röthke <marcel.roethke@haw-hamburg.de>
# Contributor: Mirco Tischler <mt-ml at gmx dot de>

pkgname=actor-framework
pkgver=1.2.0
pkgrel=1
pkgdesc="An Open Source Implementation of the Actor Model in C++"
arch=(i686 x86_64)
url="http://actor-framework.org"
license=('custom:"BSD-3-Clause"')
depends=('libgcc' 'libstdc++')
makedepends=('cmake' 'git')
optdepends=(
	'openssl: openssl support'
	)

source=("git+https://github.com/actor-framework/actor-framework#tag=${pkgver}")
sha256sums=('ffef8718d81aa21f1739ab096322c6e69dd1277a7952922350a2a9f61d0347af')

prepare(){
	cd ${pkgname}

	LDFLAGS=$LDFLAGS CXXFLAGS=$CXXFLAGS \
		./configure   \
		--prefix=/usr \
		--disable-examples \
		--build-type=RelWithDebInfo
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
