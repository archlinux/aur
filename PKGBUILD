# Maintainer: DonutsDelivery <https://github.com/DonutsDelivery>
pkgname=task-manager-linux
pkgver=0.2.0
pkgrel=1
pkgdesc='A lightweight GTK4 + Rust system task manager for Linux'
arch=('x86_64')
url='https://github.com/DonutsDelivery/task-manager-linux'
license=('MIT')
depends=('gtk4' 'libadwaita')
makedepends=('cargo' 'pkg-config')
source=("$pkgname-$pkgver.tar.gz::https://github.com/DonutsDelivery/task-manager-linux/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('c85a588617236c891beab9b7536b77fd2fed5fce5c8436ff10eb9e7afa63bd6c')

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
