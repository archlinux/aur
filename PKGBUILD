# Maintainer: Marcel Mehlmann <marcel@mzumquadrat.de>
pkgname='ttdl'
pkgver=2.0.3
pkgrel=1
pkgdesc='A CLI tool to manage todo lists in todo.txt format.'
url='https://github.com/VladimirMarkelov/ttdl'
source=("$pkgname-$pkgver.tar.gz::https://github.com/VladimirMarkelov/ttdl/archive/$pkgver.tar.gz")
arch=('x86_64')
license=('MIT')
depends=('gcc-libs')
makedepends=('cargo')
install='ttdl.install'
sha512sums=('ba3b953ac341b409762368a257bcb870b718145d12df9717098e318327729158b82d5c82c92deee2fa58c2f6b415b10ea90596d5f61f11a613d3c2eee14e9600')

build() {
	cd "$srcdir/$pkgname-$pkgver"
	cargo build --release --color auto --target-dir target
}
package() {
	cd "$srcdir/$pkgname-$pkgver"
	install -Dm755 target/release/ttdl "${pkgdir}/usr/bin/ttdl"
	install -Dm644 ttdl.toml "${pkgdir}/etc/ttdl.toml"

	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/$pkgname/LICENSE"
}
