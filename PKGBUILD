# Maintainer: jwcastillo <jwcastillo@gmail.com>
pkgname=yay-guard
pkgver=1.0.0
pkgrel=1
pkgdesc="Security audit for AUR packages before install (heuristics + AUR metadata + optional AI verdict)"
arch=('any')
url="https://github.com/jwcastillo/yay-guard"
license=('MIT')
depends=('python' 'pacman')
optdepends=(
  'yay: native v13 hook (init.lua) and the yay-guard wrapper'
  'jq: nicer formatted output for aur-deep-audit'
  'git: required by aur-deep-audit'
  'claude-code: AI verdict via your local Claude Code session'
)
install="$pkgname.install"
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
# Replace SKIP with the real checksum after tagging: `updpkgsums`
sha256sums=('dc990b9d89b7d456c86df2c624e12ed6cda6f89ee0ab561297f37c065cf44b44')

package() {
  cd "$srcdir/$pkgname-$pkgver"

  # Executables.
  install -Dm755 aur_audit.py   "$pkgdir/usr/bin/aur_audit.py"
  install -Dm755 yay-guard      "$pkgdir/usr/bin/yay-guard"
  install -Dm755 aur-deep-audit "$pkgdir/usr/bin/aur-deep-audit"

  # Example yay v13 hook config (the user opts in by copying it — see .install).
  install -Dm644 init.lua "$pkgdir/usr/share/$pkgname/init.lua"

  # Docs and license.
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm644 LICENSE   "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
