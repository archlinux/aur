# Maintainer: Luis Martinez <luis dot martinez at tuta dot io>

pkgname=amdgpud
pkgver=1.0.1
pkgrel=1
pkgdesc="Fan control service for AMD GPUs"
arch=('x86_64')
url="https://github.com/eraden/amdgpud"
license=('unknown')
depends=('gcc-libs')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=('24a2dd6888aa5b64b11e57b6b311959e32228abe3825c1527f6f88d7edf90721')

build() {
	cd "$pkgname-$pkgver"
	cargo build --release --locked --all-features --target-dir=target
}

check() {
	cd "$pkgname-$pkgver"
	cargo test --release --locked --target-dir=target
}

package() {
	cd "$pkgname-$pkgver"
	install -Dm755 "target/release/amdfand" -t "$pkgdir/usr/bin/"
	install -Dm644 amdfand.service -t "$pkgdir/usr/lib/systemd/system/"
}
