# Maintainer: KevMoriarty <kevmoriarty@gmx.com>

pkgname=vim-gmsh
pkgver=20150716
pkgrel=1
pkgdesc='A Vim syntax file for GMSH'
arch=('any')
url="https://github.com/nschloe/gmsh.vim"
license=('custom')
depends=('vim')
groups=('vim-plugins')
install=''
conflicts=('')
replaces=('')
provides=('')

# Cleaner _git format
_gitdomain='github.com'
_gituser='nschloe'
_gitname='gmsh.vim'
_gitroot="https://$_gitdomain/$_gituser/$_gitname.git"

build() {
  cd "$srcdir"
  msg "Connecting to GIT server.... [$_gitdomain:$_gituser:$_gitname]"
  if [ -d $_gitname ] ; then
    cd $_gitname && git pull origin
    msg "The local files are updated."
  else
    git clone --depth=1 $_gitroot $_gitname
  fi
  msg "GIT checkout done or server timeout"
}

package() {
  install -d ${pkgdir}/usr/share/vim/vimfiles/syntax

  install -D -m644 ${srcdir}/$_gitname/syntax/* \
    ${pkgdir}/usr/share/vim/vimfiles/syntax/
}
