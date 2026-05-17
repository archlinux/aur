# Maintainer: Julian Xhokaxhiu <info at julianxhokaxhiu dot com>
pkgname=ludo-bin
pkgver=0.22.5
pkgrel=1
pkgdesc="Ludo is a minimalist frontend for emulators"
arch=('x86_64' 'armv7h' 'aarch64')
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
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::https://github.com/libretro/ludo/releases/download/v${pkgver}/Ludo-Linux-x11-arm64-${pkgver}.tar.gz")
sha256sums=('c7ee8acced118b64c6edd54260bc31a976ef551337dcf57d2e45cbfafbe8c84b'
            '139eedd5dd868717b46032cd9773bc63b692237c37e6da4450357a3f56a18042')
sha256sums_x86_64=('98f76724e2accd9bdaa0b29d3bcf3cda90486077797852baa0fc6213c5d80cb2')
sha256sums_armv7h=('75d5f85c5171c62a72431ade11e1c458d6c71fe565cc5288bfd8a33d61d281ad')
sha256sums_aarch64=('1abd986666c97e63fcec7c6096af5824ceab3a99e18a4d7d7af7c8b80ed4c2d4')

package() {
  _ARCH=""

  if [ $arch == "armv7h" ]; then
    _ARCH="arm"
  elif [ $arch == "aarch64" ]; then
    _ARCH="arm64"
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
