# Maintainer: Kevin Schoon <me at kevinschoon dot com>

pkgname=tree-sitter-capnp
pkgver=1.5.0
pkgrel=2
pkgdesc="capnp grammar for tree-sitter"
arch=('x86_64')
url="https://github.com/amaanq/tree-sitter-capnp"
license=('MIT')
groups=('tree-sitter-grammars')
makedepends=('tree-sitter' 'tree-sitter-cli' 'npm')
provides=('libtree-sitter-capnp.so')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('65631f0bb3d221b9dbacbb0b4c05daf514b080a8328d0e52200f162c7273636a')

prepare() {
	cd "$pkgname-$pkgver"
	tree-sitter generate
}

build() {
	cd "$pkgname-$pkgver/src/"
	cc -shared -fno-exceptions -g -fPIC \
		-o "$srcdir/parser.so" parser.c
}

package() {
	install -Dvm644 parser.so "$pkgdir/usr/lib/libtree-sitter-capnp.so"
	install -dv "$pkgdir/usr/share/tree-sitter/queries/capnp"
	cd "$pkgname-$pkgver"
	install -Dvm644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
	install -Dvm644 "queries/highlights.scm" "$pkgdir/usr/share/tree-sitter/queries/capnp/highlights.scm"
	install -Dvm644 "queries/injections.scm" "$pkgdir/usr/share/tree-sitter/queries/capnp/injections.scm"
	install -Dvm644 "queries/indents.scm" "$pkgdir/usr/share/tree-sitter/queries/capnp/indents.scm"
	install -Dvm644 "queries/locals.scm" "$pkgdir/usr/share/tree-sitter/queries/capnp/locals.scm"
	install -Dvm644 "queries/folds.scm" "$pkgdir/usr/share/tree-sitter/queries/capnp/folds.scm"
}
