# Maintainer: 3Jl0y_PYCCKUi <3jl0y_pycckui@riseup.net>
# Contributor: Marcel Mehlmann <marcel@mzumquadrat.de>

pkgname='ttdl'
pkgver=4.1.0
pkgrel=2
pkgdesc='TTDL - Terminal Todo List Manager. A CLI tool to manage todo lists in todo.txt format.'
url='https://github.com/VladimirMarkelov/ttdl'
source=("$pkgname-$pkgver.tar.gz::${url}/archive/v$pkgver.tar.gz")
arch=('i686' 'pentium4' 'x86_64' 'arm' 'armv7h' 'armv6h' 'aarch64')
license=('MIT')
depends=('gcc-libs')
makedepends=('cargo')
install='ttdl.install'
b2sums=('9bf8951d3e02dcd42f625ad22d5970faef84e648fdc3e595cc208db412f7a044cce4833fcdb7bd66267f5b7fc30bef7b975924f3e3baa532397e58df294e7a20')

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
