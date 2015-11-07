# Maintainer: KevMoriarty <kevmoriarty@gmx.com>

pkgname=vim-colors-seoul256
pkgver=20150330
pkgrel=0
pkgdesc='Low-contrast Vim color scheme based on Seoul Colors'
arch=('any')
url="https://github.com/junegunn/seoul256.vim"
license=('MIT')
depends=('vim')
groups=('vim-plugins')
install=''
conflicts=('')
replaces=('')
provides=('')

# Cleaner _git format
_gitdomain='github.com'
_gituser='junegunn'
_gitname='seoul256.vim'
_gitroot="https://$_gitdomain/$_gituser/$_gitname"

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
  install -d ${pkgdir}/usr/share/vim/vimfiles/colors

  install -D -m644 ${srcdir}/$_gitname/colors/* \
    ${pkgdir}/usr/share/vim/vimfiles/colors/
}
