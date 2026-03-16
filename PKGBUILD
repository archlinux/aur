# Maintainer: Selim Bucher <selim at example dot com>
pkgname=kiwi-settings
pkgver=0.1.0
pkgrel=1
pkgdesc="Settings application for Kiwi Shell"
arch=('x86_64')
url="https://github.com/selimbucher/kiwi-settings"
license=('GPL-3.0-or-later')
depends=(
  'gtk4'
  'libadwaita'
  'python'
  'python-gobject'
  'python-cairo'
  'imagemagick'
)
makedepends=(
  'gobject-introspection'
)
optdepends=(
  'kiwi-shell: companion shell environment'
)
source=("$pkgname-$pkgver.tar.gz::https://github.com/selimbucher/$pkgname/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('387e2d6586323050fad540c741f04df82c416c31d0613364ba5351af057f8232')

build() {
  cd "$pkgname-$pkgver"
}

package() {
  cd "$pkgname-$pkgver"

  install -dm755 "$pkgdir/usr/lib/$pkgname"
  cp -r src/* "$pkgdir/usr/lib/$pkgname/"

  install -dm755 "$pkgdir/usr/bin"
  cat > "$pkgdir/usr/bin/kiwi-settings" << 'EOF'
#!/bin/bash
export PYTHONPATH="/usr/lib/kiwi-settings"
exec python3 /usr/lib/kiwi-settings/main.py "$@"
EOF
  chmod +x "$pkgdir/usr/bin/kiwi-settings"

  install -Dm644 "data/com.github.selimbucher.kiwi_settings.desktop" \
    "$pkgdir/usr/share/applications/com.github.selimbucher.kiwi_settings.desktop"
}
