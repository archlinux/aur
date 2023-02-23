# Maintainer: coffebar i8ehkvien@mozmail.com

pkgname=waybar-module-pacman-updates-git
pkgver=0.2.1
pkgrel=6
pkgdesc='Waybar module for Arch to show system updates available'
arch=('x86_64')
url="https://github.com/coffebar/waybar-module-pacman-updates"
license=('GPL')
makedepends=(cargo)
depends=(waybar)
source=("git+$url#commit=5b64d7c")
sha256sums=('SKIP')

pkgver(){
  cd "waybar-module-pacman-updates"
  git describe --tags | sed 's/^v//;s/-/+/g'
}

prepare() {
    cd "waybar-module-pacman-updates"
    cargo fetch --target "$CARCH-unknown-linux-gnu"
}

build() {
    cd "waybar-module-pacman-updates"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release
}

package() {
    cd "waybar-module-pacman-updates"
  install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/waybar-module-pacman-updates"
}
