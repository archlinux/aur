# Maintainer: FooterManDev footermandev@protonmail.com

pkgname=tritium-launcher-bin
pkgver=0.1.6
pkgrel=1
pkgdesc='Minecraft Launcher IDE for Modpack Developers'
arch=('x86_64')
url='https://github.com/Tritium-Launcher/Launcher'
license=('MIT')
source=(
  "$pkgname-$pkgver.tar.gz::https://github.com/Tritium-Launcher/Launcher/releases/download/v$pkgver/tritium-linux-x64.tar.gz"
  "$pkgname.desktop"
  "tritium-launcher.png"
  "tritium-launcher.svg"
)

sha256sums=(
  'd03019169ba29e0e8283a80e4c03d2e26289c2625b9e39bfee6b1d1b62687037'
  'SKIP'
  'SKIP'
  'SKIP'
)

depends=(
  'alsa-lib'
  'glibc'
  'libx11'
  'libxext'
  'libxi'
  'libxrender'
  'libxtst'
)

package() {
  install -dm755 "$pkgdir/opt/$pkgname"
  cp -a "$srcdir/Tritium/." "$pkgdir/opt/$pkgname/"

  install -dm755 "$pkgdir/usr/bin"
  printf '%s\n' '#!/bin/sh' \
    'exec /opt/tritium-launcher-bin/bin/Tritium "$@"' \
    > "$pkgdir/usr/bin/tritium-launcher"
  chmod 755 "$pkgdir/usr/bin/tritium-launcher"

  install -Dm644 "$srcdir/$pkgname.desktop" \
    "$pkgdir/usr/share/applications/$pkgname.desktop"

  install -Dm644 "$srcdir/tritium-launcher.png" \
    "$pkgdir/usr/share/icons/hicolor/512x512/apps/tritium-launcher.png"

  install -Dm644 "$srcdir/tritium-launcher.svg" \
    "$pkgdir/usr/share/icons/hicolor/scalable/apps/tritium-launcher.svg"

  install -Dm644 "$srcdir/Tritium/LICENSE" \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
