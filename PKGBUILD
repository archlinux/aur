# Maintainer: James H <james@jamesmcmahon.co.uk>
pkgname=linear-electron-bin
pkgver=0.1.1
pkgrel=1
pkgdesc='Unofficial Linear desktop app (linear-electron-bin)'
arch=('x86_64' 'aarch64')
url='https://github.com/hughesjs/linear-electron'
license=('MIT' 'LicenseRef-Linear-Brand' 'LicenseRef-Electron-Chromium')
provides=("linear-electron=$pkgver")
conflicts=(linear-electron linear-electron-git linear-electron-appimage )
options=('!strip' '!debug')
depends=('gtk3' 'nss' 'alsa-lib' 'libxss' 'libxtst' 'libxrandr' 'libxkbcommon' 'libdrm' 'mesa' 'libnotify' 'xdg-utils')
source_x86_64=(https://github.com/hughesjs/linear-electron/releases/download/v0.1.1/linear-electron-x64-v0.1.1.tar.gz)
sha256sums_x86_64=(f9f67c1e27b148f336cb9e65abaaf3c1cf7e38d479c3130af4b89772930b80cb)
source_aarch64=(https://github.com/hughesjs/linear-electron/releases/download/v0.1.1/linear-electron-arm64-v0.1.1.tar.gz)
sha256sums_aarch64=(750ea1179d2ddf780c91587384399f162a4ce9d9e1e532d0a0fe748e6bfc9b58)

package() {
  local bundle_arch=x64
  [[ "$CARCH" = aarch64 ]] && bundle_arch=arm64
  cd "linear-electron-$bundle_arch-v$pkgver"
  install -dm755 "$pkgdir/opt/linear-electron"
  cp -a --no-preserve=ownership . "$pkgdir/opt/linear-electron/"
  chmod 4755 "$pkgdir/opt/linear-electron/chrome-sandbox"
  install -Dm755 packaging/linear-electron "$pkgdir/usr/bin/linear-electron"
  for notice in LICENSE LICENSE.electron LICENSES.chromium.html; do
    install -Dm644 "$notice" "$pkgdir/usr/share/licenses/$pkgname/$notice"
  done
  install -Dm644 packaging/linear-electron.desktop "$pkgdir/usr/share/applications/linear-electron.desktop"
  install -Dm644 packaging/linear-electron.png "$pkgdir/usr/share/icons/hicolor/1024x1024/apps/linear-electron.png"
  install -Dm644 packaging/LINEAR-BRAND-NOTICE "$pkgdir/usr/share/licenses/$pkgname/LINEAR-BRAND-NOTICE"
}
