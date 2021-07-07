# Maintainer: Luis Martinez <luis dot martinez at tuta dot io>
# Maintainer: Tyler Johnson <TylerMackJ@gmail.com>

pkgname=hexcat
pkgver=2.2.0
pkgrel=1
pkgdesc="A hex display with Unicode symboles for specials."
url="https://github.com/TylerMackJ/Hexcat"
license=('GPL3')
arch=('x86_64')
depends=('gcc-libs')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('925589b7ea94727e09ab76159ccb48092864dbbbc772056b493d25d88e8d6594')

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
