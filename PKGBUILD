# Maintainer: Sergei Shadoy <shadoysv@gmail.com>
pkgname=work-break
pkgver=0.7.0
pkgrel=1
pkgdesc="Work and rest time balancer taking into account your current and today strain"
arch=('x86_64')
url="https://github.com/ShadoySV/work-break"
license=('MIT')
depends=('dbus')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::https://static.crates.io/crates/$pkgname/$pkgname-$pkgver.crate")
sha256sums=('7bea8b95b2d81629f91d145e3fe52540703a432b69f5121617e0144ee34317c2')

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
