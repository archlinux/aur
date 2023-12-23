# Maintainer: Kevin Schoon <me at kevinschoon dot com>

pkgname=tree-sitter-diff-git
pkgver=0.0.0
pkgrel=2
pkgdesc="diff grammar for tree-sitter"
arch=('x86_64')
url="https://github.com/the-mikedavis/tree-sitter-diff.git"
license=('MIT')
groups=('tree-sitter-grammars')
makedepends=('tree-sitter' 'tree-sitter-cli' 'npm')
provides=('tree-sitter-diff')
source=("$pkgname::git+$url")
sha256sums=('SKIP')

prepare() {
	cd "$pkgname"
	tree-sitter generate
}

build() {
	cd "$pkgname/src/"
	cc -shared -fno-exceptions -g -fPIC \
		-o "$srcdir/parser.so" parser.c
}

package() {
	install -Dvm644 parser.so "$pkgdir/usr/lib/libtree-sitter-diff.so"
	install -dv "$pkgdir/usr/share/tree-sitter/queries/diff"
	cd "$pkgname"
	install -Dvm644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
	install -Dvm644 "queries/highlights.scm" "$pkgdir/usr/share/tree-sitter/queries/diff/highlights.scm"
}
