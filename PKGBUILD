pkgname=tnb
pkgver=2.0.1
pkgrel=1
epoch=1
pkgdesc="CLI-based Telegram Notification Bot"
arch=('x86_64')
url="https://github.com/Wint3rmute/tnb.git"
license=('custom:WTFPL')
makedepends=('cargo')

source=("${pkgname}::git+https://github.com/Wint3rmute/tnb.git#tag=${pkgver}")
sha1sums=('SKIP')

prepare() {
    cd "$srcdir/${pkgname%-git}"
    cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cd "$srcdir/${pkgname%-git}"
    cargo build --frozen --release --all-features
}

package() {
    cd "$srcdir/${pkgname%-git}"
    install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$pkgname"
}

