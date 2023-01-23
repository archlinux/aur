# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Michal Wojdyla < micwoj9292 at gmail dot com >
# Contributor: Ben Alex <ben.alex@acegi.com.au>

pkgname=libstatsd-cpp
pkgver=1.1.0
pkgrel=2
_commit=7e9da79
pkgdesc='Sends statsd metrics from C++'
arch=('x86_64')
url="https://github.com/euskadi31/statsd-cpp"
license=('MIT')
depends=('gcc-libs')
makedepends=('cmake' 'git')
provides=('libstatsd.so')
source=("$pkgname::git+$url#commit=$_commit?signed")
sha256sums=('SKIP')
validpgpkeys=('3DBFB14FE67E8A0B17FB0B88939129E47D364BCA') ## Axel Etcheverry

build() {
	cd "$pkgname"
	cmake \
		-B build \
		-S ./ \
		-DCMAKE_BUILD_TYPE=None \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-Wno-dev
	cmake --build build
}

check() {
	cd "$pkgname"
	ctest --test-dir build --output-on-failure
}

package() {
	cd "$pkgname"
	DESTDIR="$pkgdir" cmake --install build
	install -Dvm644 LICENSE.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
