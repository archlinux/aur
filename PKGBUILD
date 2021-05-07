# Maintainer: Luis Martinez <luis dot martinez at tuta dot io>

pkgname=vim-yoink-git
pkgver=r91.440d939
pkgrel=1
pkgdesc="Vim plugin that maintains a yank history to cycle between when pasting"
arch=('any')
url="https://github.com/svermeulen/vim-yoink"
license=('MIT')
groups=('vim-plugins')
depends=('vim-plugin-runtime')
makedepends=('git')
optdepends=('vim-cutlass')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("$pkgname::git+$url")
sha256sums=('SKIP')

pkgver() {
  cd "$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "$pkgname"
  find autoload doc plugin \
    -type f -exec install -Dvm 644 '{}' "$pkgdir/usr/share/vim/vimfiles/{}" \;
  install -Dvm 644 License.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE.md"
  install -Dvm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
