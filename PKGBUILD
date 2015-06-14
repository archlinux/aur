# Maintainer: Xu FaSheng <fasheng.xu@gmail.com>
pkgname=vimwiki2org-git
pkgver=20130910
pkgrel=1
pkgdesc="A simple tool to convert vimwiki file to emacs org-mode file - Git version"
arch=(any)
url="https://github.com/fasheng/vimwiki2org"
license=(GPL3)
conflicts=()
provides=(vimwiki2org)
makedepends=('git')
depends=('perl>=5.14')

_gitroot="https://github.com/fasheng/vimwiki2org.git"
_gitname="vimwiki2org"

build() {
  cd "$srcdir"

  msg "Connecting to GIT server..."
  if [[ -d $_gitname ]]; then
    (cd $_gitname && git pull origin)
    msg "The local files are updated."
  else
    git clone $_gitroot $_gitname
  fi
  msg "GIT checkout done or server timeout."
}

package() {
  msg "Starting install..."
  cd "$_gitname" 
  make DESTDIR="${pkgdir}/" install
}

# vim:set ts=2 sw=2 et:
