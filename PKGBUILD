# Maintainer: KannarFr <kannarfr@gmail.com>
pkgname=friendly
pkgver=0.1.2
pkgrel=1
pkgdesc="Spotlight-style overlay that rewrites a dictated/typed message in a chosen tone via Claude Code (claude -p), then copies it to the clipboard"
arch=('any')
url="https://github.com/KannarFr/friendly"
license=('MIT')
depends=(
  'bash'
  'python'
  'python-gobject'
  'gtk3'
  'gtk-layer-shell'
  'wl-clipboard'
  'hicolor-icon-theme'
)
optdepends=(
  'claude-code: LLM backend — friendly calls `claude -p` (REQUIRED at runtime; AUR, or `npm i -g @anthropic-ai/claude-code`)'
  'wofi: Spotlight-style menu/launcher (recommended; falls back to rofi/zenity)'
  'libnotify: desktop notifications (result + progress)'
  'rofi: fallback launcher if wofi is missing'
  'zenity: last-resort fallback dialogs'
)
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
# Refreshed by CI on each release (updpkgsums); placeholder for manual builds.
sha256sums=('3b38f363864a36f9d74584b20f2a605eb1cbd71bebfc2ad9b2379bbbaa25c345')

package() {
  cd "$srcdir/$pkgname-$pkgver"

  # Executable in PATH; resources under /usr/share/friendly (the script searches
  # there via its ../share/friendly resolution).
  install -Dm755 friendly          "$pkgdir/usr/bin/friendly"
  install -Dm644 friendly-input.py "$pkgdir/usr/share/friendly/friendly-input.py"
  install -Dm644 spotlight.css     "$pkgdir/usr/share/friendly/spotlight.css"
  install -Dm644 friendly.svg      "$pkgdir/usr/share/friendly/friendly.svg"

  # Icon (so Icon=friendly in the .desktop resolves) + desktop entry.
  install -Dm644 friendly.svg      "$pkgdir/usr/share/icons/hicolor/scalable/apps/friendly.svg"
  install -Dm644 friendly.desktop  "$pkgdir/usr/share/applications/friendly.desktop"

  install -Dm644 LICENSE           "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
