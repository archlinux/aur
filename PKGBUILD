# Maintainer: giosuel <me at giosuel dot ch>
# pkgver and sha256sums are filled in from the tag by .github/workflows/release.yml.
pkgname=yay-reviewer
pkgver=0.2.0
pkgrel=1
pkgdesc="yay, but Claude reviews every AUR package's build files (PKGBUILD, install scripts, hooks) before they're built"
arch=('any')
url="https://github.com/giosuel/yay-reviewer"
license=('AGPL-3.0-only')
depends=('git' 'python' 'yay')
optdepends=("claude-code: Claude Code CLI used for the reviews (or use Anthropic's own installer)")
conflicts=('aur-reviewer')
replaces=('aur-reviewer')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('08f57e47d5d7ad93ae6e7b206ca13a0f64fac3aa58f9fec5251ac519ff93cafe')

check() {
  cd "$pkgname-$pkgver"
  python -m unittest discover -s tests
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 yay-review -t "$pkgdir/usr/bin/"
  install -Dm755 yay-reviewer-hook -t "$pkgdir/usr/lib/$pkgname/"
  install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
