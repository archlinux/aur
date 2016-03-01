# Maintainer: Dolores Portalatin <meskarune at gmail dot com>
# Contributor: Sam Stuewe <halosghost at archlinux dot info>
pkgname=vim-pony-git
pkgver=r19.a0ab2e1
pkgrel=1
pkgdesc="Pony syntax support for Vim."
arch=('any')
url="http://github.com/dleonard0/pony-vim-syntax"
license=('Public Domain')
depends=('vim')
makedepends=('git')
source=("git://github.com/dleonard0/pony-vim-syntax.git")
md5sums=('SKIP')
_gitname="pony-vim-syntax"

pkgver() {
  cd "$srcdir/$_gitname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "$srcdir/$_gitname"
  for x in ftdetect syntax; do
    install -D -m644 $x/pony.vim "${pkgdir}/usr/share/vim/vimfiles/$x/pony.vim"
  done
  install -D -m644 autoload/neomake/makers/ft/pony.vim "${pkgdir}/usr/share/vim/vimfiles/autoload/neomake/makers/ft/pony.vim"
  install -D -m644 syntax_checkers/pony/ponyc.vim "${pkgdir}/usr/share/vim/vimfiles/syntax_checkers/pony/ponyc.vim"
  install -D -m644 README.md "${pkgdir}/usr/share/vim/vimfiles/doc/vim-pony/Readme.md"
}
