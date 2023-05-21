# Maintainer: acuteenvy
pkgname=tlrc
pkgver=1.2.0
pkgrel=1
pkgdesc="A tldr client written in Rust"
arch=('x86_64')
url="https://github.com/acuteenvy/$pkgname"
license=('MIT')
makedepends=('cargo')
provides=('tldr')
conflicts=('tldr')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
b2sums=('a09cac46fae4fdfa7808d0dba9cff470673896d1d069eddf39caa5ecd54a4e279313cdfa5c6dae8dba66847b1ebd8fbab979d0c72f68dbda9eb05009e623fd3a')

prepare() {
    cd "$pkgname-$pkgver"
    cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
    cd "$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm755 "target/release/tldr" -t "$pkgdir/usr/bin"
    install -Dm644 tldr.1 -t "$pkgdir/usr/share/man/man1"
    install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
