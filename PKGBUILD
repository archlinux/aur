# Maintainer: Mara Vexa <me@maravexa.com>
pkgname=hyprcube
pkgver=0.1.0
pkgrel=1
pkgdesc="A Wayland-native settings application for Hyprland"
arch=('x86_64')
url="https://github.com/maravexa/hyprcube"
license=('MIT')
depends=(
    'fontconfig'
    'git'
    'libxkbcommon'
    'wayland'
)
makedepends=(
    'cargo'
    'rust'
)
optdepends=(
    'hyprdeck: HyprDeck settings integration'
    'hyprland: live preview, monitor control, and reload support'
    'hyprpaper: per-monitor wallpaper management and live apply'
    'hyprsaver: HyprSaver settings integration'
)
source=("$pkgname-$pkgver.tar.gz::https://github.com/maravexa/hyprcube/archive/v$pkgver.tar.gz")
# Replace with `updpkgsums` after the release tag is available.
sha256sums=('c9a7a53222c777575375a13bac96635bc72156ab7e7e0039d855ac0cc01bb649')

prepare() {
    cd "$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd "$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    cargo build --release --locked -p hyprcube
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm755 target/release/hyprcube "$pkgdir/usr/bin/hyprcube"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
