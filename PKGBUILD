# Maintainer: Andri Yngvason <andri@yngvason.is>

pkgname=wayvnc
pkgver=0.3.0
pkgrel=0
pkgdesc='VNC server for wlroots-based Wayland compositors'
arch=(x86_64)
url=https://github.com/any1/wayvnc
license=(custom:ISC)
depends=(libdrm libxkbcommon aml pixman 'neatvnc>=0.3.0' wayland)
makedepends=(meson ninja)
source=("$pkgname-v$pkgver.tar.gz::https://github.com/any1/wayvnc/archive/v$pkgver.tar.gz")
sha512sums=('a4a06a3532d11eac0b05953f166ffd058af0c31524233333dfb78321dd2f059c1a27bf0b68d8662b1e1108907161711435a31b0da005f851773de1af6351b065')

build() {
  cd $pkgname-$pkgver
  arch-meson build
  ninja -C build
}

package() {
  cd $pkgname-$pkgver
  DESTDIR="$pkgdir" ninja -C build install
  install -Dm 644 COPYING -t "$pkgdir"/usr/share/licenses/$pkgname
}
