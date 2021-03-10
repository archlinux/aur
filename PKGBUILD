# Maintainer: Marcel Mehlmann <marcel@mzumquadrat.de>
pkgname='ttdl'
pkgver=2.0.1
pkgrel=1
pkgdesc='A CLI tool to manage todo lists in todo.txt format.'
url='https://github.com/VladimirMarkelov/ttdl'
source=("$pkgname-$pkgver.tar.gz::https://github.com/VladimirMarkelov/ttdl/archive/$pkgver.tar.gz")
arch=('x86_64')
license=('MIT')
depends=('gcc-libs')
makedepends=('cargo')
install='ttdl.install'
sha512sums=('568b91f839c475e9903c7d1bbd70b1e1a32f9c30f234506f6ab476e8df6e69990f746f0244646d68fa222473ebc681fa07a935a400836e95580ba3368599b0bb')

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
