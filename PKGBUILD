# Maintainer: Jérôme Poulin <jeromepoulin@gmail.com>
pkgname=claude-conversation-search-bin
_pkgname=claude-conversation-search
pkgver=2.0.0
pkgrel=1
pkgdesc="CLI + MCP tool for searching Claude Code conversation history with Tantivy/BM25"
arch=('x86_64' 'aarch64')
url="https://github.com/ticpu/claude-conversation-search-mcp"
license=('GPL-3.0-only')
depends=('glibc' 'gcc-libs')
provides=("$_pkgname=$pkgver")
conflicts=("$_pkgname")
options=('!strip' '!debug')
validpgpkeys=('E5998E49DC9E1DCFDB9B46EC77EBA10790CFFCCD')
source=("$_pkgname-$pkgver.tar.xz::$url/releases/download/v$pkgver/$_pkgname-$pkgver.tar.xz"
        "$_pkgname-$pkgver.tar.xz.asc::$url/releases/download/v$pkgver/$_pkgname-$pkgver.tar.xz.asc")
source_x86_64=("$_pkgname-$pkgver-x86_64::$url/releases/download/v$pkgver/$_pkgname-linux-x86_64"
               "$_pkgname-$pkgver-x86_64.asc::$url/releases/download/v$pkgver/$_pkgname-linux-x86_64.asc")
source_aarch64=("$_pkgname-$pkgver-aarch64::$url/releases/download/v$pkgver/$_pkgname-linux-aarch64"
                "$_pkgname-$pkgver-aarch64.asc::$url/releases/download/v$pkgver/$_pkgname-linux-aarch64.asc")
sha256sums=('d3d3d3ccdfc2e981056bcef8e20764dc8ca9ab4418a3b10773984daa88592143'
            'SKIP')
sha256sums_x86_64=('0f25bbc8b12725d7239d9b06858754b395467af20b9a94e0a7602d1a2848c8af'
                   'SKIP')
sha256sums_aarch64=('f1af26b658d69816d4e55c3cd5c9130c10583f46812180940060bf2c48e3dbbf'
                    'SKIP')

package() {
    local bin="$pkgdir/usr/bin/$_pkgname"
    install -Dm755 "$srcdir/$_pkgname-$pkgver-$CARCH" "$bin"
    install -dm755 "$pkgdir/usr/share/bash-completion/completions" \
        "$pkgdir/usr/share/zsh/site-functions" \
        "$pkgdir/usr/share/fish/vendor_completions.d"
    "$bin" completions bash > "$pkgdir/usr/share/bash-completion/completions/$_pkgname"
    "$bin" completions zsh > "$pkgdir/usr/share/zsh/site-functions/_$_pkgname"
    "$bin" completions fish > "$pkgdir/usr/share/fish/vendor_completions.d/$_pkgname.fish"
    cd "$_pkgname-$pkgver"
    install -Dm644 packaging/$_pkgname-index.service "$pkgdir/usr/lib/systemd/user/$_pkgname-index.service"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
