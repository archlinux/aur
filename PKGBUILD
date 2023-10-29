# Maintainer: Sergei Shadoy <shadoysv@gmail.com>
pkgname=work-break
pkgver=0.4.0
pkgrel=1
pkgdesc="Work and rest time balancer taking into account your current and today strain"
arch=('x86_64')
url="https://github.com/ShadoySV/work-break"
license=('MIT')
depends=('dbus')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::https://static.crates.io/crates/$pkgname/$pkgname-$pkgver.crate")
sha256sums=('d4a165ae7419fedc5fe3a555f7fe8883967776e05cfd016fb2cb0647862278a0')

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
