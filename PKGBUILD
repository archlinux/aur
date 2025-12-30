# Maintainer: Brendan Meehan <brendan@brendanmeehan.com>
pkgname=todo-hunter
pkgver=0.2.0
pkgrel=1
pkgdesc="A fast CLI tool to scan Git repositories for TODO comments"
arch=('x86_64')
url="https://github.com/bmtron/todo-hunter"
license=('MIT')
depends=('git' 'libgit2' 'libssh2')
makedepends=('rust' 'cargo' 'pkgconf')
source=("$pkgname-$pkgver.tar.gz::https://github.com/bmtron/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('a3f7b8993b62b7ac8bd735483231a9bee5476506339f8b35778864dad45659fd')

build() {
    cd "$pkgname-$pkgver"

    export LIBGIT2_SYS_USE_PKG_CONFIG=1
    export LIBSSH2_SYS_USE_PKG_CONFIG=1

    cargo build --release --locked
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm755 "target/release/tdhunt" "$pkgdir/usr/bin/tdhunt"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
