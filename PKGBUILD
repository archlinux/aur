# $Id$
# Maintainer: BlackIkeEagle <ike DOT devolder AT gmail DOT com>

pkgname=libebur128
pkgver=1.0.1
pkgrel=2
pkgdesc="A library that implements the EBU R 128 standard for loudness normalisation."
arch=('i686' 'x86_64')
url="https://github.com/jiixyj/libebur128"
license=('MIT')
depends=('speex')
makedepends=('cmake')
source=(
	"$pkgname-$pkgver.tar.gz::https://github.com/jiixyj/$pkgname/archive/v$pkgver.tar.gz"
)

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
		-DCMAKE_INSTALL_PREFIX=/usr
	make
}

package() {
	cd "$pkgname-$pkgver"
	
	cd build
	make DESTDIR="$pkgdir" install
}

sha256sums=('01aa7aed90c593944eeb3087a6f965557dc708de360bf1a589b3babb021e7336')
