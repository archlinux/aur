# Maintainer: nari <nari@codeberg.org>
pkgname=waypai
pkgver=0.2.0
pkgrel=1
pkgdesc='Minimal Wayland overlay for drawing on your screen'
arch=('x86_64')
url='https://codeberg.org/nari/waypai'
license=('MIT')
makedepends=('cargo')
depends=('wayland')
conflicts=('waypai-git')
source=("$pkgname-$pkgver.tar.gz::https://codeberg.org/nari/waypai/archive/v$pkgver.tar.gz")
sha256sums=('148870f34b85a9eec408782f418b3dc6beaad49a6580f909065d2aa5c608591b')

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
