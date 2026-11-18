# Maintainer: jakob <jakob@linke.cx>

pkgname=yay-ai-review-git
pkgver=r1.eaafa2f
pkgrel=1
pkgdesc='yay hook: AI review of AUR build file changes before each build'
arch=('any')
url='https://github.com/schuay/yay-ai-review'
license=('MIT')
depends=('yay>=13.0.0' 'bash' 'git' 'jq')
makedepends=('git')
optdepends=(
  'claude-code: claude backend'
  'openai-codex: codex backend'
)
provides=('yay-ai-review')
conflicts=('yay-ai-review')
install=yay-ai-review.install
source=("$pkgname::git+https://github.com/schuay/yay-ai-review.git")
sha256sums=('SKIP')

pkgver() {
  cd "$pkgname"
  printf 'r%s.%s' "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

package() {
  cd "$pkgname"
  install -Dm755 -t "$pkgdir/usr/lib/yay-ai-review" review install.sh
  install -Dm644 -t "$pkgdir/usr/lib/yay-ai-review" hook.lua
  install -Dm644 -t "$pkgdir/usr/share/doc/yay-ai-review" README.md
  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
