# Maintainer: Chris Hayen <chris at shotgun dot dev>
pkgname=shotgun-lang
pkgver=0.0.11
pkgrel=1
pkgdesc="A systems programming language"
arch=('x86_64')
url="https://github.com/chrishayen/shotgun-lang"
license=('MIT')
depends=('gcc')
optdepends=('helix: editor with tree-sitter support')
source=("$pkgname-$pkgver::https://github.com/chrishayen/shotgun-lang/releases/download/v$pkgver/shotgun-linux-x86_64"
        "tree-sitter-$pkgname-$pkgver.tar.gz::https://github.com/chrishayen/shotgun-lang/releases/download/v$pkgver/tree-sitter-shotgun.tar.gz"
        "LICENSE-$pkgver::https://raw.githubusercontent.com/chrishayen/shotgun-lang/v$pkgver/LICENSE")
sha256sums=('SKIP' 'SKIP' 'SKIP')

package() {
    install -Dm755 "$srcdir/$pkgname-$pkgver" "$pkgdir/usr/bin/shotgun"
    install -Dm644 "$srcdir/LICENSE-$pkgver" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

    # Tree-sitter grammar
    install -Dm644 "$srcdir/src/parser.c" "$pkgdir/usr/share/tree-sitter-shotgun/src/parser.c"
    install -Dm644 "$srcdir/src/grammar.json" "$pkgdir/usr/share/tree-sitter-shotgun/src/grammar.json"
    install -Dm644 "$srcdir/src/node-types.json" "$pkgdir/usr/share/tree-sitter-shotgun/src/node-types.json"
    install -d "$pkgdir/usr/share/tree-sitter-shotgun/src/tree_sitter"
    install -m644 "$srcdir/src/tree_sitter/"*.h "$pkgdir/usr/share/tree-sitter-shotgun/src/tree_sitter/"

    # Helix queries
    install -Dm644 "$srcdir/queries/highlights.scm" "$pkgdir/usr/share/helix/runtime/queries/shotgun/highlights.scm"
    install -Dm644 "$srcdir/queries/highlights.scm" "$pkgdir/usr/share/tree-sitter-shotgun/queries/highlights.scm"
}
