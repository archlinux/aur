# Maintainer: insmtr <insmtr@insmtr.cn>
pkgname=cargo-ament-build
pkgver=0.1.9
pkgrel=1
pkgdesc="Cargo plugin wrapper around cargo build for ament and ROS 2 tools"
arch=('any')
url="https://github.com/ros2-rust/cargo-ament-build"
license=('Apache-2.0')
depends=('gcc-libs')
makedepends=('rust' 'cargo')
source=("$pkgname::git+https://github.com/ros2-rust/cargo-ament-build.git#tag=v$pkgver")
sha256sums=('SKIP')
options=(!debug)

build() {
    cd $pkgname
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --release
}

check() {
    cd $pkgname
    export RUSTUP_TOOLCHAIN=stable
    cargo test --release
}

package() {
    install -Dm755 $pkgname/target/release/cargo-ament-build $pkgdir/usr/bin/cargo-ament-build
}
