# Maintainer: Zmole Cristian <tragdate@gmail.com>
pkgname=rustgraph-bin
_realname=rustgraph
pkgver=0.8.3
pkgrel=1
pkgdesc="Rust code navigation built for AiDX — AST-aware, MCP-native, token-efficient. (prebuilt)"
arch=('x86_64')
url="https://github.com/ZmoleCristian/rustgraph"
license=('0BSD')
depends=('gcc-libs')
provides=("$_realname=$pkgver")
conflicts=("$_realname")
install="$_realname.install"
source=("$_realname-$pkgver-${CARCH}.tar.gz::https://github.com/ZmoleCristian/rustgraph/releases/download/v$pkgver/rustgraph-${CARCH}-unknown-linux-gnu.tar.gz")
sha256sums=('301f1643bbfa26c73149de8e32b0dd6f1b0bf4da682c7595d16db7107ec7cec7')

package() {
    cd "rustgraph-${CARCH}-unknown-linux-gnu"
    install -Dm755 "$_realname" "$pkgdir/usr/bin/$_realname"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$_realname/LICENSE"
    install -Dm644 README.md "$pkgdir/usr/share/doc/$_realname/README.md"

    if [ -f "man/$_realname.1" ]; then
        install -Dm644 "man/$_realname.1" "$pkgdir/usr/share/man/man1/$_realname.1"
    fi

    "$pkgdir/usr/bin/$_realname" completions bash > "$srcdir/$_realname.bash"
    "$pkgdir/usr/bin/$_realname" completions zsh  > "$srcdir/_$_realname"
    "$pkgdir/usr/bin/$_realname" completions fish > "$srcdir/$_realname.fish"
    install -Dm644 "$srcdir/$_realname.bash" "$pkgdir/usr/share/bash-completion/completions/$_realname"
    install -Dm644 "$srcdir/_$_realname"     "$pkgdir/usr/share/zsh/site-functions/_$_realname"
    install -Dm644 "$srcdir/$_realname.fish" "$pkgdir/usr/share/fish/vendor_completions.d/$_realname.fish"
}
