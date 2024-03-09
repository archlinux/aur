pkgname=hyprswitch
pkgver=1.2.2
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
sha256sums=('c99dd90229d34ca301bad7c9412fa3f619f5eb775d744eb8813a73787925b829')
