# Maintainer: KevMoriarty <kevmoriarty@gmx.com>

pkgname=vim-vimtex
pkgver=20150721
pkgrel=1
pkgdesc='A Vim plugin for editing LaTeX files'
arch=('any')
url="https://github.com/lervag/vimtex"
license=('MIT')
depends=('vim')
groups=('vim-plugins')
install='vimdoc.install'
conflicts=('')
replaces=('')
provides=('')

# Cleaner _git format
_gitdomain='github.com'
_gituser='lervag'
_gitname='vimtex'
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
  install -d ${pkgdir}/usr/share/vim/vimfiles/{after/syntax,autoload/vimtex,compiler,doc,ftplugin,indent,test}

  install -D -m644 ${srcdir}/$_gitname/after/syntax/* \
    ${pkgdir}/usr/share/vim/vimfiles/after/syntax/

  install -D -m644 ${srcdir}/$_gitname/autoload/vimtex.vim \
    ${pkgdir}/usr/share/vim/vimfiles/autoload/

  install -D -m644 ${srcdir}/$_gitname/autoload/vimtex/* \
    ${pkgdir}/usr/share/vim/vimfiles/autoload/vimtex/

  install -D -m644 ${srcdir}/$_gitname/compiler/* \
    ${pkgdir}/usr/share/vim/vimfiles/compiler/

  install -D -m644 ${srcdir}/$_gitname/doc/* \
    ${pkgdir}/usr/share/vim/vimfiles/doc/

  install -D -m644 ${srcdir}/$_gitname/ftplugin/* \
    ${pkgdir}/usr/share/vim/vimfiles/ftplugin/

  install -D -m644 ${srcdir}/$_gitname/indent/* \
    ${pkgdir}/usr/share/vim/vimfiles/indent/
}
