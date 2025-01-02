pkgname=hyprswitch
pkgver=3.2.0
pkgrel=1
pkgdesc="A CLI/GUI that allows switching between windows in Hyprland"
arch=('any')
url="https://github.com/h3rmt/hyprswitch/"
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
    cargo build --frozen --release --all-features
}

package() {
    install -Dm0755 -t "$pkgdir/usr/bin/" "$pkgname-$pkgver/target/release/$pkgname"
}

post_install() {
    echo "Please restart the hyprswitch daemon"
}
sha256sums=('9a020e33769103a589b8b26fd3ba28ad25a2fbf7903a873b6c880b259888a3ce')
