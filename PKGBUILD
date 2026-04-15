# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=vim-emmet-git
pkgver=r1117.92ef2f7
pkgrel=1
pkgdesc="Vim plugin for expanding abbreviations similar to Emmet"
arch=('any')
url="https://github.com/mattn/emmet-vim"
license=('MIT')
groups=('vim-plugins')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("$pkgname::git+$url")
sha256sums=('SKIP')

pkgver() {
  cd "$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  depends=('vim-plugin-runtime')
  cd "$pkgname"
  find autoload doc lua plugin ! -name '*.gif' \
    -type f -exec install -Dvm644 '{}' "$pkgdir/usr/share/vim/vimfiles/{}" \;
  install -Dvm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
  install -Dvm644 README.mkd TUTORIAL.mkd -t "$pkgdir/usr/share/doc/$pkgname/"
}
