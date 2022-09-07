# Maintainer: Francois Rigaut <frigaut at gmail dot com>

pkgname=yorick-ml4-git
pkgver=20201115
pkgrel=1
pkgdesc="yorick I/O to matlab4 data format"
arch=('i686' 'x86_64')
license=('GPL')
url="https://github.com/LLNL/yorick-ml4"
groups=('science' 'yorick-all')
depends=('yorick' 'yorick-yutils-git')
makedepends=('yorick')

_gitroot="https://github.com/LLNL/yorick-ml4.git"
_gitname="yorick-ml4"

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
