# Maintainer: jcvega <jcvega0b1@gmail.com>
pkgname=hypr-relay
pkgver=0.4.0
pkgrel=1
pkgdesc="Lightweight daemon for Hyprland that bridges system events to desktop notifications"
arch=('x86_64')
url="https://github.com/Vega-0b1/hypr-relay"
license=('MIT')
depends=('libpulse' 'wireplumber' 'brightnessctl' 'bluez-utils')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::https://github.com/Vega-0b1/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('3511076c6d96ac2b3a4f4c7d47653a76e347c28444ffb0a2c996f6b3d6f63f59')

prepare() {
    cd "$pkgname-$pkgver"
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd "$pkgname-$pkgver"
    cargo build --release --locked
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm755 target/release/hypr-relay "$pkgdir/usr/bin/hypr-relay"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
