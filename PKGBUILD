# Maintainer: Gord Stephen <mail at gord dot io>

_ref=''
pkgname=kak-lsp-git
pkgver=v3.5.0.r0.4b9fb2e
pkgrel=1
pkgdesc='Kakoune Language Server Protocol Client'
arch=('x86_64')
url="https://github.com/ul/kak-lsp"
license=('custom:unlicense')
depends=('kakoune')
makedepends=('git' 'rustup')
optdepends=() # Language servers
provides=("kak-lsp")
conflicts=("kak-lsp")
install="kak-lsp-git.install"
source=("${pkgname}::git+https://github.com/ul/kak-lsp${_ref}")
md5sums=('SKIP')

pkgver() {
	cd "${srcdir}/${pkgname}"
	printf "%s" "$(git describe --long | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
}

build() {
	cd "${srcdir}/${pkgname}"
	cargo build --release
}

package() {
	cd "${srcdir}/${pkgname}"
	install -Dt "${pkgdir}/usr/bin" target/release/kak-lsp
	install -Dt "${pkgdir}/etc/" kak-lsp.toml 
	install -Dt "${pkgdir}/usr/lib/systemd/user" kak-lsp.service 
	install -D UNLICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

