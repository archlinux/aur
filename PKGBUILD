# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: hanchain <85230240+HanchaiN@users.noreply.github.com>

pkgname=lyrical
pkgver=0.5.0
pkgrel=1
pkgdesc='Simple lyrics program for waybar and others'
arch=(x86_64)
url='https://github.com/tblelrd/lyrical'
license=(GPL-3.0-or-later)
depends=(dbus libgcc openssl)
makedepends=(cargo)
source=("$pkgname-$pkgver.tar.gz::https://static.crates.io/crates/$pkgname/$pkgname-$pkgver.crate")
sha256sums=('df15cca026980fc5c88df290be8897a86432fdf33f2e0b27ab92dc7468feecee')

prepare() {
    cd "$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target host-tuple
}

build() {
    cd "$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    export OPENSSL_NO_VENDOR=1
    cargo build --frozen --release --all-features
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm755 target/release/lyrical -t "$pkgdir/usr/bin/"
    install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
    install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
