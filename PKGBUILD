# Maintainer: Julian Xhokaxhiu <info at julianxhokaxhiu dot com>
pkgname=ludo
pkgver=0.4.2
pkgrel=1
pkgdesc="Ludo is a work in progress libretro frontend written in go."
arch=('x86_64' 'armv7h')
url="https://github.com/libretro/ludo"
license=('MIT')
depends=(
  'glfw'
  'openal'
  'mesa'
)
source=(
  "ludo.json"
  "ludo.desktop"
)
source_x86_64=("${pkgname}-${pkgver}.tar.gz::https://github.com/libretro/ludo/releases/download/v${pkgver}/Ludo-Linux-x86_64-${pkgver}.tar.gz")
source_armv7h=("${pkgname}-${pkgver}.tar.gz::https://github.com/libretro/ludo/releases/download/v${pkgver}/Ludo-Linux-arm-${pkgver}.tar.gz")
sha256sums=(
  '89e860320694d3bec02942bb81af01a8553d5f49c4c50a2cbf377d6252b481a5'
  '139eedd5dd868717b46032cd9773bc63b692237c37e6da4450357a3f56a18042'
)
sha256sums_x86_64=('49b23ea80815cb9dbd49c856008c079223765138833b4f3dad3ee6d9816bafb4')
sha256sums_armv7h=('c1f705eb4fa53d8a2e8531db52b0313e5aed42783f9a9492ed356a3410c15f6c')

package() {
  _ARCH=""

  if [ $arch == "armv7h" ]; then
    _ARCH="arm"
  else
    _ARCH="$arch"
  fi

  install -Dm644 "ludo.json" "$pkgdir/etc/ludo.json"
  install -Dm644 "ludo.desktop" "$pkgdir/usr/share/applications/ludo.desktop"

  cd "$srcdir/Ludo-Linux-$_ARCH-$pkgver"

  install -Dm755 "ludo" "$pkgdir/usr/bin/ludo"
  install -Dm755 "assets/icon.svg" "$pkgdir/usr/share/pixmaps/ludo.svg"
  install -dm644 "$pkgdir/usr/share/ludo"
  cp -R "assets/" "$pkgdir/usr/share/ludo/assets"
  cp -R "cores/" "$pkgdir/usr/share/ludo/cores"
  cp -R "database/" "$pkgdir/usr/share/ludo/database"
}
