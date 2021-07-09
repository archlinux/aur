# Maintainer: Luis Martinez <luis dot martinez at tuta dot io>
# Maintainer: Tyler Johnson <TylerMackJ@gmail.com>

pkgname=hexcat
pkgver=2.3.3
pkgrel=1
pkgdesc="A hex display with Unicode symboles for specials."
url="https://github.com/TylerMackJ/Hexcat"
license=('GPL3')
arch=('x86_64')
depends=('gcc-libs')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('d86f19f02e0f99bed2140c5fe025036c6a207146993a36df843dc8e0bb99aa39')

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
