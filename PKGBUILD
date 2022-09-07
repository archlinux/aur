# Maintainer: Francois Rigaut <frigaut at gmail dot com>

pkgname=yorick-yutils-git
pkgver=20201115
pkgrel=1
pkgdesc="General utilies for yorick"
arch=('any')
license=('GPL')
url="https://github.com/frigaut/yorick-yutils"
groups=('science' 'yorick-all')
depends=('yorick')
makedepends=('git' 'yorick')
provides=('yorick-yutils')
conflicts=('yorick-yutils')
replaces=('yorick-yutils')

_gitroot="https://github.com/frigaut/yorick-yutils.git"
_gitname="yorick-yutils"

build() {
  cd ${srcdir}
  msg "Connecting to git repo..."
  if [ -d ${srcdir}/$_gitname ] ; then
      cd $_gitname && git pull origin
      msg "The local files are updated."
  else
      git clone $_gitroot
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting script install..."

  git clone $_gitname $_gitname-build
  cd ${srcdir}/$_gitname-build

  yorick -batch make.i
  make
}

package() {
  cd ${srcdir}/$_gitname-build
  make DESTDIR=${pkgdir} install
}
