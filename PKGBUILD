# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=nmail
pkgver=3.74
pkgrel=1
pkgdesc='Terminal-based email client'
arch=('x86_64')
url='https://github.com/d99kris/nmail'
license=('MIT')
depends=(
	'cyrus-sasl'
	'libetpan.so'
	'libmagic.so'
	'libncursesw.so'
	'libsqlite3.so'
	'libxapian.so'
	'openssl'
	'python')
makedepends=('cmake')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('1f6fd6454df76cdcfe10be595ab4fef5a0ef7255be88c48f74b8dd0277e5f883')

build() {
	cmake \
		-B build \
		-S "$pkgname-$pkgver" \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-DCMAKE_BUILD_TYPE=None \
		-Wno-dev
	cmake --build build
}

package() {
	DESTDIR="$pkgdir" cmake --install build
	install -Dm644 "$pkgname-$pkgver/LICENSE" -t "$pkgdir/usr/share/licenses/$pkgname/"
}
