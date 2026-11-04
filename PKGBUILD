# Maintainer: Elia Nitsche <nitscheelia at gmail dot com>
# Contributor: H3rmt

# This is a fork of the original hyprswitch as it got renamed to hyprshell!

pkgname=hyprswitch
pkgver=6.0.0.alpha.1
_pkgver=6.0.0-alpha.1
pkgrel=1
pkgdesc="A CLI/GUI that allows switching between windows in Hyprland"
arch=('any')
url="https://github.com/egnrse/hyprswitch/"
license=("MIT")
makedepends=('cargo')
depends=('hyprland' 'gtk4-layer-shell' 'gtk4')
source=("$pkgname-$_pkgver.tar.gz::https://github.com/egnrse/hyprswitch/archive/refs/tags/v${_pkgver}.tar.gz")
sha256sums=('3fae9ceff3bfb02dd32469dab27f761af7eda4ef8e4fc60875f19e4a2b5a1602')

prepare() {
    export RUSTUP_TOOLCHAIN=stable
    cd "$pkgname-$_pkgver"
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cd "$pkgname-$_pkgver"
    cargo build --frozen --release
}

package() {
    install -Dm0755 -t "$pkgdir/usr/bin/" "$pkgname-$_pkgver/target/release/$pkgname"
}

post_install() {
    echo "Please restart the hyprswitch daemon"
}
