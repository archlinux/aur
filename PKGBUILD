# Maintainer: Julian Xhokaxhiu <info at julianxhokaxhiu dot com>
pkgname=ludo
pkgver=0.5.3
pkgrel=1
pkgdesc="Ludo is a minimalist frontend for emulators"
arch=('x86_64' 'armv7h')
url="https://github.com/libretro/ludo"
license=('GPL3')
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
sha256sums_x86_64=('3187e1b1db10a2bc03b3b8f2c0e7b720801b1d6c73df6e81be399fd1e82dc2d8')
sha256sums_armv7h=('9044e7fa8408972dc570a474ddf4998df34fb2d63395eabc097b7e091340274c')

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
  install -dm755 "$pkgdir/usr/share/ludo"
  cp -R "assets/" "$pkgdir/usr/share/ludo/assets"
  cp -R "cores/" "$pkgdir/usr/share/ludo/cores"
  cp -R "database/" "$pkgdir/usr/share/ludo/database"
  chmod -R 0755 "$pkgdir/usr/share/ludo"
}
