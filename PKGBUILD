# Maintainer: Adam Perkowski <adas1per@protonmail.com>
pkgname='hyprlauncher'
pkgver=0.1.9
pkgrel=1
pkgdesc='GUI for launching applications, written in blazingly fast Rust!'
arch=('x86_64')
url="https://github.com/hyprutils/$pkgname"
license=('GPL-2.0')
source=("$pkgname-$pkgver.tar.gz::https://github.com/hyprutils/$pkgname/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('556b4fc473b40b816696e793d4b5ed84fc7aadb0026ca0400147cdcdd5a29748')
makedepends=('rustup' 'glibc' 'gcc-libs')
depends=('gtk4' 'gtk4-layer-shell')

prepare() {
    export RUSTUP_TOOLCHAIN=stable

    cd "$pkgname-$pkgver"

    cargo fetch --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target

    cd "$pkgname-$pkgver"

    cargo build --frozen --release
}

package() {
    cd "$pkgname-$pkgver"

    install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$pkgname"
}
