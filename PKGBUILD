# Maintainer: Francois Rigaut <frigaut at gmail dot com>

pkgname=yorick-hdf5-git
pkgver=20201115
pkgrel=1
pkgdesc="HDF5 wrappers for yorick"
arch=('i686' 'x86_64')
license=('GPL')
url="https://github.com/frigaut/yorick-hdf5"
groups=('science' 'yorick-all')
depends=('yorick' 'yorick-yutils-git' 'hdf5_18')
makedepends=('yorick')
provides=('yorick-hdf5')
conflicts=('yorick-hdf5')
replaces=('yorick-hdf5')


_gitroot="https://github.com/frigaut/yorick-hdf5.git"
_gitname="yorick-hdf5"

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
