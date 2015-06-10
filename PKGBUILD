# Maintainer: Jameson Pugh <imntreal@gmail.com>
# Contributor: Ross Melin <rdmelin@gmail.com>

pkgname=zmviewer-svn
pkgver=r211
pkgrel=1
pkgdesc="SVN version of a zoneminder client written in Qt "
arch=('i686' 'x86_64')
url="http://sourceforge.net/projects/zmviewer/"
license=('GPL')
depends=('qt4')
makedepends=('subversion')
provides=(zmviewer)
conflicts=(zmviewer)
source=('zmviewer::svn+https://zmviewer.svn.sourceforge.net/svnroot/zmviewer/trunk')
md5sums=('SKIP')

_svnmod=zmviewer

pkgver() {
  cd "${_svnmod}"
  local ver="$(svnversion)"
  printf "r%s" "${ver//[[:alpha:]]}"
}

build() {
  cd "${srcdir}/${_svnmod}"

  rm -rf build
  mkdir -p build

  cd build

  cmake -DCMAKE_INSTALL_PREFIX:PATH=/usr .. || return 1

  make || return 1
}

package() {
  cd "${srcdir}/${_svnmod}/build"

  make DESTDIR="${pkgdir}/" install
}

# vim:set ts=2 sw=2 et:
