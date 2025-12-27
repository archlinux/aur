# Maintainer: Brendan Meehan <brendan@brendanmeehan.com>
pkgname=todo-hunter
pkgver=0.1.0
pkgrel=1
pkgdesc="A fast CLI tool to scan Git repositories for TODO comments"
arch=('x86_64')
url="https://github.com/bmtron/todo-hunter"
license=('MIT')
depends=('git' 'libgit2' 'libssh2')
makedepends=('rust' 'cargo' 'pkgconf')
source=("$pkgname-$pkgver.tar.gz::https://github.com/bmtron/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('5da02555987a351884ebd5bc40d2723c8ebfbe918faed8416278c5fa8ee0e51c')

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
