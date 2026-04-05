# Maintainer: saatvik333 <saatvik333sharma@gmail.com>
pkgname=bongocat
pkgver=2.0.0
pkgrel=1
pkgdesc="Delightful Wayland overlay that displays an animated bongo cat reacting to keyboard input"
arch=('x86_64' 'aarch64')
url="https://github.com/saatvik333/wayland-bongocat"
license=('MIT')
depends=('wayland')
makedepends=('make' 'gcc')
source=("$pkgname-$pkgver.tar.gz::https://github.com/saatvik333/wayland-bongocat/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('7f080cad5acdbce08323287ad05b252c95fb0095a1795364c2130eab1bdcf70c')

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
