# Maintainer: Julian Xhokaxhiu <info at julianxhokaxhiu dot com>
pkgname=ludo-bin
pkgver=0.17.3
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
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::https://github.com/libretro/ludo/releases/download/v${pkgver}/Ludo-Linux-x11-x86_64-${pkgver}.tar.gz")
source_armv7h=("${pkgname}-${pkgver}-armv7h.tar.gz::https://github.com/libretro/ludo/releases/download/v${pkgver}/Ludo-Linux-x11-arm-${pkgver}.tar.gz")
sha256sums=('c7ee8acced118b64c6edd54260bc31a976ef551337dcf57d2e45cbfafbe8c84b'
            '139eedd5dd868717b46032cd9773bc63b692237c37e6da4450357a3f56a18042')
sha256sums_x86_64=('cbc50992e9910543f055bfdc55d489988d1bdb96451642fa5787b9fcd81020ba')
sha256sums_armv7h=('c7066b3a9735c7d0af92a23ff2ab32c9b25d07db7207722d9606c786c60ea908')

package() {
  _ARCH=""

  if [ $arch == "armv7h" ]; then
    _ARCH="arm"
  else
    _ARCH="$arch"
  fi

  install -Dm644 "ludo.toml" "$pkgdir/etc/ludo.toml"
  install -Dm644 "ludo.desktop" "$pkgdir/usr/share/applications/ludo.desktop"

  cd "$srcdir/Ludo-Linux-x11-$_ARCH-$pkgver"

  install -Dm755 "ludo" "$pkgdir/usr/bin/ludo"
  install -Dm755 "assets/icon.svg" "$pkgdir/usr/share/pixmaps/ludo.svg"
  install -dm755 "$pkgdir/usr/share/ludo"
  cp -R "assets/" "$pkgdir/usr/share/ludo/assets"
  cp -R "cores/" "$pkgdir/usr/share/ludo/cores"
  cp -R "database/" "$pkgdir/usr/share/ludo/database"
  chmod -R 0755 "$pkgdir/usr/share/ludo"
}
