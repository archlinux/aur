# $Id$
# Maintainer: BlackIkeEagle <ike DOT devolder AT gmail DOT com>

pkgname=libebur128
pkgver=1.0.3
pkgrel=1
pkgdesc="A library that implements the EBU R 128 standard for loudness normalisation."
arch=('i686' 'x86_64')
url="https://github.com/jiixyj/libebur128"
license=('MIT')
depends=('speex')
makedepends=('cmake')
source=(
	"$pkgname-$pkgver.tar.gz::https://github.com/jiixyj/$pkgname/archive/v$pkgver.tar.gz"
)
sha256sums=('dd90d0e44bd4db1e038d990b4538a7317b2f44f29eaf2e206c247663234d9d52')

prepare() {
	cd "$pkgname-$pkgver"

	[[ -d build ]] && rm -rf build
	mkdir build
}

build() {
	cd "$pkgname-$pkgver"

	cd build
	cmake .. \
		-DCMAKE_BUILD_TYPE=Release \
		-DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_INSTALL_LIBDIR=lib
	make
}

package() {
	cd "$pkgname-$pkgver"
	
	cd build
	make DESTDIR="$pkgdir" install
}

