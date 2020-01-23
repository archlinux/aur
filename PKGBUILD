# Maintainer: Jean Lucas <jean@4ray.co>

pkgname=wayvnc
pkgver=0+r83+gda3cf24
_commit=da3cf24a825b180528fd6e12a43b9dbd8166e0e9
pkgrel=1
pkgdesc='VNC server for wlroots-based Wayland compositors'
arch=(x86_64)
url=https://github.com/any1/wayvnc
license=(custom:ISC)
depends=(libglvnd libxkbcommon neatvnc)
makedepends=(git meson ninja)
source=(git+$url#commit=$_commit)
sha512sums=('SKIP')

pkgver() {
  cd $pkgname
  echo 0+r$(git rev-list --count HEAD)+g$(git rev-parse --short HEAD)
}

build() {
  mkdir -p build
  arch-meson build $pkgname
  ninja -C build
}

package() {
  DESTDIR="$pkgdir" ninja -C build install
  install -Dm 644 $pkgname/COPYING -t "$pkgdir"/usr/share/licenses/$pkgname
}
