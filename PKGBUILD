# Maintainer: Andri Yngvason <andri@yngvason.is>

pkgname=wayvnc
pkgver=0.3.1
pkgrel=2
pkgdesc='VNC server for wlroots-based Wayland compositors'
arch=(x86_64)
url=https://github.com/any1/wayvnc
license=(custom:ISC)
depends=(libdrm libxkbcommon aml pixman 'neatvnc>=0.3.0' wayland)
makedepends=(meson ninja scdoc)
source=("$pkgname-v$pkgver.tar.gz::https://github.com/any1/wayvnc/archive/v$pkgver.tar.gz")
sha512sums=('0ddfd949b76a4dc140b825f488eb887cf4608a685b9d2b8a514a2ad5b436baf2ea1cdcd159ec98e22bf3724daab71822d5beded3695dd05b4b062ad76ad3f25b')

build() {
  cd $pkgname-$pkgver
  arch-meson build -Dman-pages=enabled
  ninja -C build
}

package() {
  cd $pkgname-$pkgver
  DESTDIR="$pkgdir" ninja -C build install
  install -Dm 644 COPYING -t "$pkgdir"/usr/share/licenses/$pkgname
}
