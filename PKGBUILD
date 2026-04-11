# Maintainer: fabse

pkgname=ron-lsp-git
_pkgname=ron-lsp
pkgver=v0.1.3
pkgrel=1
pkgdesc="An LSP and CLI for RON files that provides autocomplete, diagnostics, go to definition, code actions, and hover support based on Rust type annotations"
arch=('aarch64' 'x86_64')
url="https://github.com/jasonjmcghee/ron-lsp"
license=("MIT")
makedepends=('cargo' 'git')
conflicts=("ron-lsp")
provides=("ron-lsp")
source=('git+https://github.com/jasonjmcghee/ron-lsp')

pkgver() {
	cd "$_pkgname"
	git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
	cd "$_pkgname"
	cargo fetch --target "$CARCH-unknown-linux-gnu"
}

build() {
	cd "$_pkgname"
	cargo build --release
}

package() {
	cd "$_pkgname"
	install -Dm755 "target/release/ron-lsp" "$pkgdir/usr/bin/ron-lsp"
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

sha256sums=('SKIP')
