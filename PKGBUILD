pkgname=hyprshell
# x-release-please-start-version
pkgver=4.0.4
# x-release-please-end
pkgrel=1
pkgdesc="A modern GTK4-based window switcher and application launcher for Hyprland"
arch=('any')
url="https://github.com/h3rmt/hyprshell/"
license=("MIT")
makedepends=('cargo')
depends=('hyprland' 'gtk4-layer-shell' 'gtk4')
source=("$pkgname-$pkgver.tar.gz::https://static.crates.io/crates/$pkgname/$pkgname-$pkgver.crate")

prepare() {
    export RUSTUP_TOOLCHAIN=stable
    cd "$pkgname-$pkgver"
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cd "$pkgname-$pkgver"
    cargo build --frozen --release
}

package() {
    install -Dm0755 -t "$pkgdir/usr/bin/" "$pkgname-$pkgver/target/release/$pkgname"
}
sha256sums=('65e4f50b42f3f9643873ec8332b756dbc02d2e5b7ae5024a4ba7e42cb3e3c50a')
