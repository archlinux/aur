# Maintainer: Maxim Baz <$pkgbuild at maximbaz dot com>

pkgname=kak-lsp
pkgver=5.9.0
pkgrel=1
pkgdesc='Kakoune Language Server Protocol Client'
arch=('x86_64')
url='https://github.com/ul/kak-lsp'
license=('custom:unlicense')
depends=('kakoune')
makedepends=('rust')
optdepends=(
    'bash-language-server: language server for Bash'
    'python-language-server: language server for Python'
    'go-langserver-git: language server for Go'
)
source=("$pkgname-$pkgver.tar.gz::https://github.com/ul/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('3de10eb4c92f12888e457fbf314ec255fc4da0f10c7c3ce9d9dbb937ad95cb73')

build() {
    cd "$srcdir/$pkgname-$pkgver"
    cargo build --release
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    install -Dm755 -t "$pkgdir/usr/bin" target/release/$pkgname
    install -Dm644 -t "$pkgdir/usr/share/$pkgname/examples/" $pkgname.toml
    install -Dm644 UNLICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=4 sw=4 et:
