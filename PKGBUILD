# Maintainer: Ariel Popper < a at arielp dot com  >

_realname="IndentFinder-vim"

pkgname=('vim-indentfinder-hg')
pkgver=55_ec4e8baa59b5
pkgrel=1
pkgdesc="Set vim's indentation scheme to match a newly opened buffer"
arch=('any')
license=('BSD')
url='http://www.freehackers.org/Indent_Finder'
depends=('vim' 'python2-indentfinder-hg')
makedepends=('mercurial')
source=("$_realname::hg+http://sources.freehackers.org/IndentFinder")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$_realname"
  hg identify -ni | awk 'BEGIN{OFS="_";} {print $2,$1}'
}

package() {
  _vimfiles="$pkgdir/usr/share/vim/vimfiles"
  
  cd "$srcdir/$_realname"
  
  sed -i 's/$//' indent_finder.vim
  sed -i 's/python/python2/' indent_finder.vim

  install -d "$_vimfiles/plugin"
  install -m644 indent_finder.vim "$_vimfiles/plugin"
  install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
