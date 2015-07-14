# Maintainer: Timothy Redaelli <timothy.redaelli@gmail.com>
pkgname=vim-extradite-git
pkgver=20110302
pkgrel=1
pkgdesc="A git commit browser. Latest git version"
arch=('any')
url="http://int3.github.com/vim-extradite/"
license=('custom:public-domain')
groups=('vim-plugins')
depends=('vim' 'vim-fugitive')
makedepends=('git')
source=(license.txt)
install=vimdoc.install
md5sums=('6c8165541cda0defa2adc6ad03bfea6e')
_gitroot='git://github.com/int3/vim-extradite.git'
_gitname=vim-extradite

build() {
  cd "${srcdir}"
  msg "Connecting to GIT server...."

  if [ -d ${_gitname} ] ; then
    cd ${_gitname} && git pull origin
    msg "The local files are updated."
  else
    git clone ${_gitroot} ${_gitname}
  fi

  msg "GIT checkout done or server timeout"
  cd "${srcdir}/${_gitname}"

  local _installpath="${pkgdir}/usr/share/vim/vimfiles"

  install -Dm644 doc/extradite.txt "${_installpath}"/doc/extradite.txt
  install -Dm644 plugin/extradite.vim "${_installpath}"/plugin/extradite.vim
  install -Dm644 "${srcdir}"/license.txt "${pkgdir}/usr/share/licenses/${pkgname}/license.txt"
}

# vim:set ts=2 sw=2 et:
