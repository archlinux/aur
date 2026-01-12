pkgname=rofi-wifi
pkgver=1.0.0
pkgrel=1
pkgdesc="Rofi plugin for managing Wi-Fi networks."
arch=('x86_64')
url="https://github.com/bjn7/rofi-wifi"
license=('MIT')
depends=('rofi' 'glib2')
makedepends=('git' 'rust' 'cargo' 'clang' 'pkgconf') # Add any other build tools your script needs
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('7071fa68b461bee8463b2ae6ae400d0f132c5aaea675c4c6c6e52c55ddeab0c1')

build() {
  cd "$pkgname-$pkgver"
  cargo build --release
}

package() {
  cd "$pkgname-$pkgver"  
  install -Dm755 "target/release/libwifi.so" "$pkgdir/usr/lib/rofi/libwifi.so"
  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}