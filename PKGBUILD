# Maintainer: DonutsDelivery <https://github.com/DonutsDelivery>
pkgname=task-manager-linux
pkgver=0.1.1
pkgrel=1
pkgdesc='A lightweight GTK4 + Rust system task manager for Linux'
arch=('x86_64')
url='https://github.com/DonutsDelivery/task-manager-linux'
license=('MIT')
depends=('gtk4' 'libadwaita')
makedepends=('cargo' 'pkg-config')
source=("$pkgname-$pkgver.tar.gz::https://github.com/DonutsDelivery/task-manager-linux/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('4a97330783d38d98f189b02612c13eded7defe156418f952a77de0fa1ad0de4f')

prepare() {
    cd "$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd "$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
    install -Dm644 "data/task-manager.desktop" "$pkgdir/usr/share/applications/task-manager.desktop"
}
