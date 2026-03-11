# Maintainer: mishl <meow@mishl.dev>
pkgname=mouse-debounce
pkgver=0.1.3
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
sha256sums=('3f2048ab935f2141af273c78cfeee44a801a3c092b1072b12a13d40a6fbe8c7a'
            '1e74ab9bbf6eef0bac57840329200a49eee0eb990a92d4d22ff21796e7ee592b'
            'b76d8338e535bc42fce6e07408d072ad9e7a6902127c4367a4dfcc5faf839b82')
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
