# shellcheck shell=bash disable=SC2034,SC2154
_pkgname=jq-lsp
pkgname=$_pkgname-git
pkgver=r29.e962d87
pkgrel=1
pkgdesc="jq language server"
arch=(x86 x86_64 arm aarch64)
url=https://github.com/wader/jq-lsp
license=(MIT)
source=("git+$url")
sha256sums=(SKIP)

pkgver() {
	cd "$srcdir/$_pkgname" || return 1
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$srcdir/$_pkgname" || return 1
	go build -o jq-lsp .
}

package() {
	cd "$srcdir/$_pkgname" || return 1
	install -D "$_pkgname" -t "$pkgdir/usr/bin"
	install -Dm644 README.md -t "$pkgdir/usr/share/doc/$_pkgname"
}
