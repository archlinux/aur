# Maintainer: jcvega <jcvega0b1@gmail.com>
pkgname=hypr-relay
pkgver=0.3.0
pkgrel=1
pkgdesc="Lightweight daemon for Hyprland that bridges system events to desktop notifications"
arch=('x86_64')
url="https://github.com/Vega-0b1/hypr-relay"
license=('MIT')
depends=('wireplumber' 'brightnessctl' 'bluez-utils')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::https://github.com/Vega-0b1/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('ad69785594bf3f55d7f72d2768be221d1e385650c01beb4c982f56f46f50f5c1')

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
