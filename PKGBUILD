pkgname=omarchy-lazygit-theme-sync
pkgver=1.1.0
pkgrel=1
pkgdesc="Automatic lazygit theme synchronization for Omarchy"
arch=('any')
url="https://github.com/prepin/omarchy-lazygit-theme-sync"
license=('MIT')
depends=('bash' 'lazygit')
makedepends=('git')
install=omarchy-lazygit-theme-sync.install
source=("$pkgname-$pkgver.tar.gz::https://github.com/prepin/$pkgname/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('SKIP')

package() {
  cd "$pkgname-$pkgver"

  # Main executable
  install -Dm755 omarchy-lazygit-theme-sync "$pkgdir/usr/bin/omarchy-lazygit-theme-sync"

  # Supporting scripts (installed to /usr/bin for easy access)
  install -Dm755 scripts/lazygit-theme-apply.sh "$pkgdir/usr/bin/omarchy-lazygit-theme-apply.sh"
  install -Dm755 scripts/lazygit-theme-generate.sh "$pkgdir/usr/bin/omarchy-lazygit-theme-generate.sh"

  # Wrapper (kept in /usr/share as template)
  install -Dm755 wrappers/lazygit "$pkgdir/usr/share/$pkgname/lazygit-wrapper"

  # Hook template
  install -Dm644 hooks-append/theme-set "$pkgdir/usr/share/$pkgname/theme-set-hook"

  # Bundled themes
  install -d "$pkgdir/usr/share/$pkgname/themes"
  install -m644 themes/*.yml "$pkgdir/usr/share/$pkgname/themes/"

  # Documentation
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
