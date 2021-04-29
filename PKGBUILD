# Maintainer: Luis Martinez <luis dot martinez at tuta dot io>

pkgname=vim-wiki-ft-git
pkgver=r23.03a6e36
pkgrel=1
pkgdesc="Simple Vim filetype plugin for Wiki files"
arch=('any')
url="https://github.com/lervag/wiki-ft.vim"
license=('MIT')
groups=('vim-plugins')
depends=('vim-plugin-runtime' 'vim-wiki')
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
  find autoload doc ftdetect ftplugin syntax \
    -type f -exec install -Dvm 644 '{}' "$pkgdir/usr/share/vim/vimfiles/{}" \;
  install -Dvm 644 LICENSE.md -t "$pkgdir/usr/share/licenses/$pkgname/"
  install -Dvm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}