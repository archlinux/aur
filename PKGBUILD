# Maintainer: 3Jl0y_PYCCKUi <3jl0y_pycckui@riseup.net>
# Contributor: Marcel Mehlmann <marcel@mzumquadrat.de>

pkgname='ttdl'
pkgver=4.2.1
pkgrel=2
pkgdesc='TTDL - Terminal Todo List Manager. A CLI tool to manage todo lists in todo.txt format.'
url='https://github.com/VladimirMarkelov/ttdl'
source=("$pkgname-$pkgver.tar.gz::${url}/archive/v$pkgver.tar.gz")
arch=('i686' 'pentium4' 'x86_64' 'arm' 'armv7h' 'armv6h' 'aarch64')
license=('MIT')
depends=('gcc-libs')
makedepends=('cargo')
install='ttdl.install'
b2sums=('06fea86f11393839dc50fd2e2998d170c74fb712ba66cb2fd18594b67567891778cd814ffb86c19cbb3537b1133d8e02f16a3e51b401d7114a7506f2927005b6')

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
