# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=nmail
pkgver=3.89
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
sha256sums=('83a1762901088b29ef784d2fbea46f232e5afcf188cfe5c3b15834b860ed949a')

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
