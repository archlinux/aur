# Maintainer: mishl <meow@mishl.dev>
pkgname=mouse-debounce
pkgver=0.2.3
pkgrel=1
pkgdesc="Software mouse button debounce daemon for worn switches"
arch=('x86_64')
url="https://github.com/mishl-dev/mouse-debounce"
license=('MIT')
depends=('libevdev')
makedepends=('rust' 'cargo')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz"
        "mouse-debounce.install::$url/raw/main/mouse-debounce.install"
        "mouse-debounce.service::$url/raw/main/mouse-debounce.service")
sha256sums=('925d1c4fd091a9b7867de631f1b62174201dc1a7ebdd2c9a897eaf74feb474ff'
            '1e74ab9bbf6eef0bac57840329200a49eee0eb990a92d4d22ff21796e7ee592b'
            '13fbb3cf94063d39e2d14a3a94d66ec1730521731e0145b9e96eedf67bfcbdd9')
install=mouse-debounce.install

build() {
  cd "$pkgname-$pkgver"
  cargo build --release --locked
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 target/release/mouse-debounce "$pkgdir/usr/bin/mouse-debounce"
  install -Dm644 mouse-debounce.service "$pkgdir/usr/lib/systemd/system/mouse-debounce.service"
  install -Dm644 config/config.example.toml "$pkgdir/usr/share/mouse-debounce/config.example.toml"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
