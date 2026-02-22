# Maintainer: nari <nari@codeberg.org>
pkgname=waypai
pkgver=0.1.0
pkgrel=1
pkgdesc='Keyboard-driven Wayland overlay for drawing on your screen'
arch=('x86_64')
url='https://codeberg.org/nari/waypai'
license=('MIT')
makedepends=('cargo')
depends=('wayland')
conflicts=('waypai-git')
source=("$pkgname-$pkgver.tar.gz::https://codeberg.org/nari/waypai/archive/v$pkgver.tar.gz")
sha256sums=('967af622128311a5873e9dc6ed3525d5764de11d563e1da8fc32ce798bba65a7')

prepare() {
    cd "$pkgname"
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd "$pkgname"
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release
}

package() {
    cd "$pkgname"
    install -Dm755 target/release/waypai "$pkgdir/usr/bin/waypai"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
