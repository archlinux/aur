# Maintainer: Elia Nitsche <nitscheelia at gmail dot com>
# Contributor: H3rmt

# This is a fork of the original hyprswitch as it got renamed to hyprshell!

pkgname=hyprswitch
# x-release-please-start-version
pkgver=3.3.2
# x-release-please-end
pkgrel=1
pkgdesc="A CLI/GUI that allows switching between windows in Hyprland"
arch=('any')
url="https://github.com/egnrse/hyprswitch/"
license=("MIT")
makedepends=('cargo')
depends=('hyprland' 'gtk4-layer-shell' 'gtk4')
source=("$pkgname-$pkgver.tar.gz::https://github.com/egnrse/hyprswitch/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('4007e7dbc8d47b1a2a0afd17ceb0323ea1ae63d07cf0f9e85d6e4c99bc052e10')

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
