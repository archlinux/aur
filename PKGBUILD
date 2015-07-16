# Maintainer: KevMoriarty <kevmoriarty@gmx.com>

pkgname=vim-easy-align
pkgver=20150716
pkgrel=1
pkgdesc='A Vim alignment plugin'
arch=('any')
url="https://github.com/junegunn/vim-easy-align"
license=('MIT')
depends=('vim')
groups=('vim-plugins')
install='vimdoc.install'
conflicts=('')
replaces=('')
provides=('')

# Cleaner _git format
_gitdomain='github.com'
_gituser='junegunn'
_gitname='vim-easy-align'
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
  install -d ${pkgdir}/usr/share/vim/vimfiles/{autoload,doc,plugin}

  install -D -m644 ${srcdir}/$_gitname/autoload/* \
    ${pkgdir}/usr/share/vim/vimfiles/autoload/

  install -D -m644 ${srcdir}/$_gitname/doc/* \
    ${pkgdir}/usr/share/vim/vimfiles/doc/

  install -D -m644 ${srcdir}/$_gitname/plugin/* \
    ${pkgdir}/usr/share/vim/vimfiles/plugin/
}
