# Maintainer: TarkoGabor (@tgabor7)
pkgname=wlock-git
pkgver=0.0.0
pkgrel=1
pkgdesc="A very simple screen locker for Wayland"
arch=('x86_64')
url="https://github.com/tgabor7/sl"
license=('BSD')
depends=('wayland' 'wayland-protocols' 'cargo')
source=("sl-$pkgver-linux.tar.gz::https://github.com/tgabor7/sl/archive/tags/v$pkgver.tar.gz")
b2sums=('SKIP')
md5sums=('SKIP')

pkgver() {
    cd "sl-tags-v$pkgver"
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    export RUSTUP_TOOLCHAIN=stable
    tar -xf "sl-$pkgver-linux.tar.gz"
    cd "sl-tags-v$pkgver"
    cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release --all-features
}

package() {
    install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$pkgname"
}
