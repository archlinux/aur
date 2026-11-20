# Maintainer: Natetronn
# AUR package built from the release tarball (prebuilt binaries).
# pkgver and sha256sums are updated by scripts/publish-release.py for each release.
pkgname=penates-bin
pkgver=0.1.5
pkgrel=1
pkgdesc="Turn websites into desktop apps with their own window, icon and login"
arch=('x86_64')
url="https://github.com/Natetronn/penates"
license=('MIT')
depends=('webkit2gtk-4.1' 'gtk3' 'libayatana-appindicator')
optdepends=('xdg-utils: open links and downloads in your browser')
provides=('penates')
conflicts=('penates')
options=('!debug')   # prebuilt binaries: a debug package would be empty
source=("https://github.com/Natetronn/penates/releases/download/v${pkgver}/penates-${pkgver}-x86_64-unknown-linux-gnu.tar.gz")
sha256sums=('56e298c32d1dc50378f9912ac3c3c5c5dec0847f1062c3e60a0adfeda2806a5f')

package() {
  cd "penates-${pkgver}-x86_64-unknown-linux-gnu"
  install -Dm755 bin/penates         "$pkgdir/usr/bin/penates"
  install -Dm755 bin/penates-desktop "$pkgdir/usr/bin/penates-desktop"
  install -Dm644 penates.desktop     "$pkgdir/usr/share/applications/penates.desktop"
  for s in 32 64 128; do install -Dm644 "icons/${s}x${s}.png" "$pkgdir/usr/share/icons/hicolor/${s}x${s}/apps/penates.png"; done
  install -Dm644 "icons/128x128@2x.png" "$pkgdir/usr/share/icons/hicolor/256x256/apps/penates.png"
  install -Dm644 "icons/icon.png"       "$pkgdir/usr/share/icons/hicolor/512x512/apps/penates.png"
  install -Dm644 "icons/icon.svg"       "$pkgdir/usr/share/icons/hicolor/scalable/apps/penates.svg"
  install -Dm644 LICENSE            "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 THIRD-PARTY-LICENSES.txt "$pkgdir/usr/share/licenses/$pkgname/THIRD-PARTY-LICENSES.txt"
}
