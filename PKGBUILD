# Maintainer: insayd Cyan <insadamt@github>
pkgname=mpwall
pkgver=1.0.3
pkgrel=1
pkgdesc="A terminal-native animated video wallpaper manager for Hyprland/Wayland"
arch=('x86_64')
url="https://github.com/Lamess-UI/mpwall"
license=('MIT')
depends=('mpvpaper' 'gawk')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('dff6cc979d16062d1d19f5ccfadf98793b53c1cfbf91c7d9a0380a2b5c043fe1')

prepare() {
    cd "$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$(rustc -vV | sed 's/host: //;t;d')"
}

build() {
    cd "$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release --all-features
}

check() {
    cd "$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    cargo test --frozen --all-features
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
