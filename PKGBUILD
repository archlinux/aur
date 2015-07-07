# Maintainer: Jeremy 'Ichimonji10' Audet <ichimonji10 at gmail dot com>

pkgname=vim-dwm-git
_repository=dwm.vim
pkgver=6149e58 # see pkgver()
pkgrel=1
pkgdesc='Dynamic Window Manager behaviour for Vim'
arch=(any)
url='http://www.vim.org/scripts/script.php?script_id=4186'
license=(custom)
groups=(vim-plugins)
depends=(vim)
makedepends=(git)
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("git+https://github.com/spolu/${_repository}.git")

sha256sums=(SKIP)

pkgver() {
  cd "$_repository"
  git describe --always | sed 's/-/./g'
}

build() {
  cd "$srcdir/$_repository"
  sed -n '/Copyright:/,/Name Of File:/p' plugin/dwm.vim > LICENSE
}

package() {
  cd "$srcdir/$_repository"
  install -Dm 644 doc/dwm.txt \
    "$pkgdir/usr/share/vim/vimfiles/doc/dwm.txt"
  install -Dm 644 plugin/dwm.vim \
    "$pkgdir/usr/share/vim/vimfiles/plugin/dwm.vim"
  install -Dm 644 LICENSE \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:
