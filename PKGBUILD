# Maintainer: Luis Martinez <luis dot martinez at tuta dot io>
# Maintainer: Tyler Johnson <TylerMackJ@gmail.com>

pkgname=hexcat
pkgver=2.3.4
pkgrel=1
pkgdesc="A hex display with Unicode symboles for specials."
url="https://github.com/TylerMackJ/Hexcat"
license=('GPL3')
arch=('x86_64')
depends=('gcc-libs')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('fcafee507d839c65e9b8d83d49c915ca796ed2fa9e2dada613b2728c4b66b001')

build() {
	cd "${pkgname^}-$pkgver"
	cargo build --release --locked --all-features --target-dir=target
}

check() {
	cd "${pkgname^}-$pkgver"
	cargo test --release --locked --target-dir=target
}

package() {
	cd "${pkgname^}-$pkgver"
	install -Dm 755 target/release/hexcat -t "$pkgdir/usr/bin/"
	install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
