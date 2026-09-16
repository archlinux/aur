# Maintainer: mirarrapp <iknowarch@proton.me>
pkgname=zii-bin
pkgver=0.2.1
pkgrel=1
pkgdesc="Blazing-fast photo viewer and editor for Omarchy Linux"
arch=('x86_64')
url="https://github.com/mirarr-app/zii"
license=('MIT')
depends=('quickshell' 'glibc' 'gcc-libs')
provides=('zii')
conflicts=('zii')
options=(!debug)

source=("$pkgname-$pkgver.tar.gz::https://github.com/mirarr-app/zii/releases/download/v$pkgver/zii-v$pkgver-x86_64-unknown-linux-gnu.tar.gz")
sha256sums=('a7f102c6ca3c30437cda01bb9ae5f5ffa3a40ce3f1ca655cc0f9801984563449')

package() {
  local _src="zii-v${pkgver}-x86_64-unknown-linux-gnu"
  cd "$srcdir/$_src"

  # Binary
  install -Dm755 zii "$pkgdir/usr/bin/zii"

  # UI files
  install -dm755 "$pkgdir/usr/share/zii/ui"
  cp -r ui/* "$pkgdir/usr/share/zii/ui/"
  find "$pkgdir/usr/share/zii/ui" -type d -exec chmod 755 {} +
  find "$pkgdir/usr/share/zii/ui" -type f -exec chmod 644 {} +

  # Desktop entry
  install -Dm644 zii.desktop "$pkgdir/usr/share/applications/zii.desktop"

  # Icons
  install -Dm644 assets/zii.svg "$pkgdir/usr/share/icons/hicolor/scalable/apps/zii.svg"
  install -Dm644 assets/zii.svg "$pkgdir/usr/share/pixmaps/zii.svg"
  install -Dm644 assets/zii.png "$pkgdir/usr/share/icons/hicolor/512x512/apps/zii.png"
  install -Dm644 assets/zii.png "$pkgdir/usr/share/pixmaps/zii.png"
  for sz in 32 48 64 128 256; do
    if [ -f "assets/zii-${sz}.png" ]; then
      install -Dm644 "assets/zii-${sz}.png" "$pkgdir/usr/share/icons/hicolor/${sz}x${sz}/apps/zii.png"
    fi
  done

  # License & Documentation
  if [ -f LICENSE ]; then
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  fi
  if [ -f README.md ]; then
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
  fi
}
