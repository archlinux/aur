# Maintainer: mfwolffe
pkgname=rank
pkgver=0.1.1
pkgrel=1
pkgdesc="GNU sort reimplementation: byte-identical output, MSD radix sorting"
arch=('x86_64' 'aarch64')
url="https://github.com/tenseleyFlow/rank"
license=('MIT')
makedepends=('gcc')
source=("$url/releases/download/v$pkgver/rank-$pkgver.tar.gz")
sha256sums=('6cffe28390ed82e5a188e524c81e6789ccf8bf0c4a9e9f9b464e2c680392aed0')

build() {
	cd "$pkgname-$pkgver"
	./configure
	make
}

# The unit suite is self-contained; the golden parity suite wants a GNU
# sort oracle and runs in the release pipeline before tagging.
check() {
	cd "$pkgname-$pkgver"
	sh tests/unit/run.sh
}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir" PREFIX=/usr install
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
