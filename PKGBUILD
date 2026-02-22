# ~/Documents/git/hyprquotes/workflow/PKGBUILD 22 Feb at 04:56:53 AM
# Maintainer: Inknyto <mbaye.sene.etu@esmt.sn>
pkgname=hyprquotes
pkgver=1.0.0
pkgrel=1
pkgdesc="Floating programming quote overlay for Hyprland"
arch=('x86_64')
url="https://github.com/Inknyto/hyprquotes"
license=('GPL-2.0-only')
depends=(
  'python'
  'python-gobject'
  'python-cairo'
  'gtk3'
  'wl-clipboard'
  'hyprland'
)
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('fab8d198e7cc08a71bed3f1573ec3b4ff6bd41af5a0881c279d70029c1902b0e')

package() {
  cd "$pkgname-$pkgver"

  # Application
  install -Dm644 hyprquotes.py "$pkgdir/usr/share/hyprquotes/hyprquotes.py"

  # Default quotes (only used if ~/.config/hyprquotes/ doesn't exist)
  install -Dm644 assets/programming-quotes.json \
    "$pkgdir/usr/share/hyprquotes/assets/programming-quotes.json"

  # Launcher
  install -Dm755 /dev/stdin "$pkgdir/usr/bin/hyprquotes" <<'EOF'
#!/usr/bin/env bash
exec python3 /usr/share/hyprquotes/hyprquotes.py "$@"
EOF

  # License
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
