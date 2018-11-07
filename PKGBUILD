# Maintainer: Maxim Baz <$pkgbuild at maximbaz dot com>

pkgname=kak-lsp
pkgver=5.9.1
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
sha256sums=('b21fd5e92cf4bb33194b1eb71f79c50aab81f24be28a734794c33bd852d74bff')

build() {
    cd "$pkgname-$pkgver"
    cargo build --release --locked
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm755 -t "$pkgdir/usr/bin" target/release/$pkgname
    install -Dm644 -t "$pkgdir/usr/share/$pkgname/examples/" $pkgname.toml
    install -Dm644 UNLICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=4 sw=4 et:
