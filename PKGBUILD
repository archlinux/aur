# Maintainer: giosuel <arch at giosuel dot ch>
pkgname=aur-reviewer
pkgver=0.1.0
pkgrel=1
pkgdesc="Have Claude review AUR build files (PKGBUILD, install scripts, hooks) before yay builds them"
arch=('any')
url="https://github.com/giosuel/aur-reviewer"
license=('AGPL-3.0-only')
depends=('git' 'python' 'yay')
optdepends=("claude-code: Claude Code CLI used for the reviews (or use Anthropic's own installer)")
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('a4785f4053e7e4b3e0e87c13c47e86c35ac198d9682b77136b261cb9c14c596f')

check() {
  cd "$pkgname-$pkgver"
  python -m unittest discover -s tests
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 aur-review aur-update -t "$pkgdir/usr/bin/"
  install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
