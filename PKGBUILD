# Maintainer: Elia Nitsche <nitscheelia at gmail dot com>
# Contributor: H3rmt

# This is a fork of the original hyprswitch as it got renamed to hyprshell!

pkgname=hyprswitch
pkgver=5.0.0
pkgrel=1
pkgdesc="A CLI/GUI that allows switching between windows in Hyprland"
arch=('any')
url="https://github.com/egnrse/hyprswitch/"
license=("MIT")
makedepends=('cargo')
depends=('hyprland' 'gtk4-layer-shell' 'gtk4')
source=("$pkgname-$pkgver.tar.gz::https://github.com/egnrse/hyprswitch/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('f47916c755ccf11920b281c2fa643ffce71757674e2bb78ba0a4adb06efed3d8')

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

post_install() {
    echo "Please restart the hyprswitch daemon"
}
