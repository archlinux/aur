# Maintainer: fengkx <liangkx8237 [At] gmail.com>
pkgname=webarchiver
pkgver=0.1.1
pkgrel=0
pkgdesc=""
arch=("x86_64")
url="https://github.com/fengkx/webarchiver/"
license=('MIT')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::https://github.com/fengkx/$pkgname/archive/refs/tags/v$pkgver.tar.gz")
sha1sums=("9933121859d28d696f5e23d6084ae6cb6a80bd9c")

build() {
	cd "$pkgname-$pkgver"
	cargo build --release --locked --all-features --target-dir=target
	strip target/release/${pkgname}
}
package() {
	cd "$pkgname-$pkgver"
	install -Dm644 "LICENSE" "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
	install -Dm 755 target/release/${pkgname} -t "${pkgdir}/usr/bin"
}
