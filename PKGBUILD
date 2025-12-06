# Maintainer: saatvik333 <saatvik333sharma@gmail.com>
pkgname=bongocat
pkgver=1.3.0
pkgrel=1
pkgdesc="Delightful Wayland overlay that displays an animated bongo cat reacting to keyboard input"
arch=('x86_64' 'aarch64')
url="https://github.com/saatvik333/wayland-bongocat"
license=('MIT')
depends=('wayland')
makedepends=('wayland-protocols' 'make' 'gcc')
source=("$pkgname-$pkgver.tar.gz::https://github.com/saatvik333/wayland-bongocat/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('b43a8ae7a9612e5ca64c0783c25d4bb76758464057a46e14fa222f8129d4d237')

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
}
