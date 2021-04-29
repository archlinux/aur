# Maintainer: Luis Martinez <luis dot martinez at tuta dot io>

pkgname=vim-emmet-git
pkgver=r1079.46e6067
pkgrel=1
pkgdesc="Vim plugin for expanding abbreviations similar to Emmet"
arch=('any')
url="https://github.com/mattn/emmet-vim"
license=('MIT')
groups=('vim-plugins')
depends=('vim-plugin-runtime')
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
  cd "$pkgname"
  find autoload doc plugin ! -name '*.gif' \
    -type f -exec install -Dvm 644 '{}' "$pkgdir/usr/share/vim/vimfiles/{}" \;
  install -Dvm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
  install -Dvm 644 README.mkd TUTORIAL.mkd -t "$pkgdir/usr/share/doc/$pkgname/"
}
