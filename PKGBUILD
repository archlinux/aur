# Maintainer: saatvik333 <saatvik333sharma@gmail.com>
pkgname=bongocat
pkgver=2.0.1
pkgrel=1
pkgdesc="Delightful Wayland overlay that displays an animated bongo cat reacting to keyboard input"
arch=('x86_64' 'aarch64')
url="https://github.com/saatvik333/wayland-bongocat"
license=('MIT')
depends=('wayland')
makedepends=('make' 'gcc')
source=("$pkgname-$pkgver.tar.gz::https://github.com/saatvik333/wayland-bongocat/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('8c5a9ea3e69f66fa477203266b58f4a49d678c2449c10eba25f8457c31fa37dc')

build() {
  cd "wayland-bongocat-$pkgver"
  make release
}

package() {
  cd "wayland-bongocat-$pkgver"
  install -Dm755 build/bongocat "$pkgdir/usr/bin/bongocat"
  install -Dm755 scripts/find_input_devices.sh "$pkgdir/usr/bin/bongocat-find-devices"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 bongocat.conf.example "$pkgdir/usr/share/doc/$pkgname/bongocat.conf.example"
  install -Dm644 man/bongocat.1 "$pkgdir/usr/share/man/man1/bongocat.1"
}
