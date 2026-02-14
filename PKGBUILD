# Maintainer: saatvik333 <saatvik333sharma@gmail.com>
pkgname=bongocat
pkgver=1.4.0
pkgrel=1
pkgdesc="Delightful Wayland overlay that displays an animated bongo cat reacting to keyboard input"
arch=('x86_64' 'aarch64')
url="https://github.com/saatvik333/wayland-bongocat"
license=('MIT')
depends=('wayland')
makedepends=('wayland-protocols' 'make' 'gcc')
source=("$pkgname-$pkgver.tar.gz::https://github.com/saatvik333/wayland-bongocat/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('488e911db2127fa740535d4228fa76d83cbe7427c7644675a0b242eba807c57e')

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
