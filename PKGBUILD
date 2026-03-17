# Maintainer: shaweel <shaweel@proton.me>
pkgname=shaweeltimer
pkgver=1.0.0
pkgrel=1
pkgdesc="A highly customizable timer application."
arch=('any')
url="https://github.com/shaweel/shaweelTimer"
license=('MIT')
depends=('python' 'python-gobject' 'gtk4' 'libadwaita')
source=("$pkgname-$pkgver.tar.gz::https://github.com/shaweel/shaweelTimer/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('SKIP')

package() {
  cd "$srcdir/shaweelTimer-$pkgver"

  install -Dm755 main.py "$pkgdir/usr/lib/shaweeltimer/main.py"
  install -Dm755 config.py "$pkgdir/usr/lib/shaweeltimer/config.py"
  install -Dm755 status.py "$pkgdir/usr/lib/shaweeltimer/status.py"
  install -Dm644 assets/shaweelTimer.png "$pkgdir/usr/share/icons/hicolor/256x256/apps/shaweeltimer.png"
  install -Dm644 me.shaweel.shaweelTimer.metainfo.xml "$pkgdir/usr/share/metainfo/me.shaweel.shaweelTimer.metainfo.xml"

  install -dm755 "$pkgdir/usr/bin"
  printf '#!/bin/bash\nGSK_RENDERER=ngl python3 /usr/lib/shaweeltimer/main.py "$@"' \
    > "$pkgdir/usr/bin/shaweeltimer"
  chmod +x "$pkgdir/usr/bin/shaweeltimer"

  install -Dm644 /dev/stdin "$pkgdir/usr/share/applications/shaweeltimer.desktop" << EOF
[Desktop Entry]
Name=shaweelTimer
Exec=shaweeltimer
Icon=shaweeltimer
Type=Application
Categories=Utility;
EOF
}