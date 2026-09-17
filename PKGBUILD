# Maintainer: James H <james@jamesmcmahon.co.uk>
pkgname=linear-electron-bin
pkgver=0.1.0
pkgrel=1
pkgdesc='Unofficial Linear desktop app (linear-electron-bin)'
arch=('x86_64' 'aarch64')
url='https://github.com/hughesjs/linear-electron'
license=('MIT' 'LicenseRef-Electron-Chromium')
provides=("linear-electron=$pkgver")
conflicts=(linear-electron linear-electron-git linear-electron-appimage )
options=('!strip' '!debug')
depends=('gtk3' 'nss' 'alsa-lib' 'libxss' 'libxtst' 'libxrandr' 'libxkbcommon' 'libdrm' 'mesa' 'libnotify' 'xdg-utils')
source_x86_64=(https://github.com/hughesjs/linear-electron/releases/download/v0.1.0/linear-electron-x64-v0.1.0.tar.gz)
sha256sums_x86_64=(2bb919247071f834218b031cd3106ecdb12a17e960548d7d58a51c2bcadcc615)
source_aarch64=(https://github.com/hughesjs/linear-electron/releases/download/v0.1.0/linear-electron-arm64-v0.1.0.tar.gz)
sha256sums_aarch64=(0d4da4bc7ad046bce6d80a75ad5320c2059da8ba295fef37cc5104a39c802866)

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
  install -Dm644 packaging/linear-electron.svg "$pkgdir/usr/share/icons/hicolor/scalable/apps/linear-electron.svg"
}
