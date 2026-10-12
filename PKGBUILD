# Maintainer: Sergei Shadoy <shadoysv@gmail.com>
pkgname=work-break
pkgver=0.7.3
pkgrel=1
pkgdesc="Work and rest time balancer taking into account your current and today strain"
arch=('x86_64')
url="https://github.com/ShadoySV/work-break"
license=('MIT')
depends=('dbus')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::https://static.crates.io/crates/$pkgname/$pkgname-$pkgver.crate")
sha256sums=('bcc7ed659fc0032a80a99a28b0ca2cad2f3edbe7fbbb4612a4ce2938d16fe5bd')

prepare() {
    cd "$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
    cd "$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release --all-features
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$pkgname"
    cp -r ./extra/linux/* "$pkgdir"
    install -Dm0644 -t "$pkgdir/usr/share/license/work-break" LICENSE
}
