# Maintainer: Julian Xhokaxhiu <info at julianxhokaxhiu dot com>
pkgname=ludo-bin
pkgver=0.13.0
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
  "ludo.toml"
  "ludo.desktop"
)
source_x86_64=("${pkgname}-${pkgver}.tar.gz::https://github.com/libretro/ludo/releases/download/v${pkgver}/Ludo-Linux-x86_64-${pkgver}.tar.gz")
source_armv7h=("${pkgname}-${pkgver}.tar.gz::https://github.com/libretro/ludo/releases/download/v${pkgver}/Ludo-Linux-arm-${pkgver}.tar.gz")
sha256sums=(
  'c7ee8acced118b64c6edd54260bc31a976ef551337dcf57d2e45cbfafbe8c84b'
  '139eedd5dd868717b46032cd9773bc63b692237c37e6da4450357a3f56a18042'
)
sha256sums_x86_64=('25b5fabbec90161c8de3a5d4e763b3508ca35f12bf6f5999ead6b73fa407fa73')
sha256sums_armv7h=('9b2fb5502dc317a8a40059062e72020c8592a1266b205a098b8aeefb0582cf06')

package() {
  _ARCH=""

  if [ $arch == "armv7h" ]; then
    _ARCH="arm"
  else
    _ARCH="$arch"
  fi

  install -Dm644 "ludo.toml" "$pkgdir/etc/ludo.toml"
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
