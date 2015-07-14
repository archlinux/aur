# Maintainer: Timothy Redaelli <timothy.redaelli@gmail.com>
pkgname=vim-securemodelines-git
pkgver=20111103
pkgrel=1
pkgdesc="A secure alternative to Vim modelines. Latest git version"
arch=('any')
url="http://github.com/ciaranm/securemodelines"
license=('custom:vim')
groups=('vim-plugins')
conflicts=('vim-securemodelines')
depends=('vim')
makedepends=('git')
source=(license.txt)
md5sums=('9cbc86548400621ea7ad55d4386d81e2')
_gitroot="git://github.com/ciaranm/securemodelines.git"
_gitname="securemodelines"

package() {
  cd "$srcdir"
  msg "Connecting to GIT server...."

  if [[ -d "$_gitname" ]]; then
    cd "$_gitname" && git pull origin
    msg "The local files are updated."
  else
    git clone "$_gitroot" "$_gitname"
  fi

  msg "GIT checkout done or server timeout"

  rm -rf "$srcdir/$_gitname-build"
  git clone "$srcdir/$_gitname" "$srcdir/$_gitname-build"
  cd "$srcdir/$_gitname-build"

  local _installpath="${pkgdir}/usr/share/vim/vimfiles"

  install -Dm644 plugin/securemodelines.vim "${_installpath}"/plugin/securemodelines.vim
  install -Dm644 "${srcdir}"/license.txt "${pkgdir}/usr/share/licenses/${pkgname}/license.txt"
}

# vim:set ts=2 sw=2 et:
