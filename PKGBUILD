# Maintainer: 3Jl0y_PYCCKUi <3jl0y_pycckui@riseup.net>
# Contributor: Marcel Mehlmann <marcel@mzumquadrat.de>

pkgname='ttdl'
pkgver=4.3.0
pkgrel=2
pkgdesc='TTDL - Terminal Todo List Manager. A CLI tool to manage todo lists in todo.txt format.'
url='https://github.com/VladimirMarkelov/ttdl'
source=("$pkgname-$pkgver.tar.gz::${url}/archive/v$pkgver.tar.gz")
arch=('i686' 'pentium4' 'x86_64' 'arm' 'armv7h' 'armv6h' 'aarch64')
license=('MIT')
depends=('gcc-libs')
makedepends=('cargo')
install='ttdl.install'
b2sums=('7ac07aaa6a65c6a84cf32f4d3a42b48eca139768ad0bb31d375ce03a21c617c4c755ecf8100bd4b348977a377d1aff049e8e18bf045f25e503753ad6d6ff35e8')

build() {
	cd "$srcdir/$pkgname-$pkgver"
	cargo build --locked --release --color auto --target-dir target
}

check() {
	cd "$srcdir/$pkgname-$pkgver"
	cargo test --locked --release --color auto --target-dir target
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
	install -Dm755 target/release/ttdl "${pkgdir}/usr/bin/ttdl"
	install -Dm644 ttdl.toml "${pkgdir}/etc/ttdl.toml"
	install -Dm644 README.md "$pkgdir/usr/share/doc/${pkgname}/README.md"
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/$pkgname/LICENSE"
}
