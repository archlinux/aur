# Maintainer: Sergei Shadoy <shadoysv@gmail.com>
pkgname=work-break
pkgver=0.3.1
pkgrel=1
pkgdesc="Work and rest time balancer for Windows / MacOS / Linux desktops"
arch=('x86_64')
url="https://github.com/ShadoySV/work-break"
license=('MIT')
depends=('dbus')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::https://static.crates.io/crates/$pkgname/$pkgname-$pkgver.crate")
sha256sums=('b715b666c26bd0793fc3cb3d018c1a77e7345f203cd45e23fc005ded57604194')

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
