# vim:set ts=2 sw=2 et ft=sh tw=100: expandtab
# Maintainer: Piotr Rogoża <rogoza dot piotr at gmail dot com>
# Contributor: Jason Seeley <jamiseeley (at) yahoo (dot) com>

pkgname=vim-tlib
pkgver=1.04
_scriptid=19179
pkgrel=2
pkgdesc="Utility functions for VIM plugins"
arch=('any')
url="http://www.vim.org/scripts/script.php?script_id=1863"
license=('GPL')
depends=(vim)
groups=('vim-plugins')
install='vimdoc.install'
source=($pkgname-$pkgver.vba::http://www.vim.org/scripts/download_script.php?src_id=${_scriptid})
md5sums=('b64ce6764f39f40bfc95f3916bbb0057')

package() {
	cd "$srcdir"
	_vim_dir='usr/share/vim/vimfiles'
  install -dm755 "$pkgdir"/$_vim_dir

  vim -c "set nomore" -c "UseVimball $srcdir" -c "q" $pkgname-$pkgver.vba
  tar -c ./ \
    --exclude $pkgname-$pkgver.vba \
    --exclude .VimballRecord \
    --exclude doc/tags \
    | tar -x -C "$pkgdir"/$_vim_dir
}

