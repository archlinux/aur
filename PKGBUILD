# Maintainer: Samuel Mesa <samuelmesa@linuxmail.org>
# Contributor: F0ruD<fzerorubigd{AT}gmail{DOT}com>

pkgname=libsquish-svn
pkgver=66
pkgrel=1
pkgdesc="DXT compression library - svn build"
arch=('i686' 'x86_64')
url="http://libsquish.sourceforge.net"
makedepends=('subversion' 'cmake')
license=('MIT')
provides=('libsquish')
conflicts=('libsquish')

source=("${pkgname}::svn+http://svn.code.sf.net/p/libsquish/code/trunk")
md5sums=('SKIP')

pkgver() {
  svnversion "${SRCDEST}/${pkgname}" | tr -d [A-z]
}

build() {
  cd "${pkgname}"  

  #Build
  if [[ -d "build" ]]; then
    (rm -rf build)
  fi

  mkdir build
  cd build

  cmake ../ -DCMAKE_INSTALL_PREFIX=/usr \
  -DBUILD_MINI_SFX=ON \
  -DBUILD_MINI_EXAMPLE=ON \
  -DBUILD_MINI_TOOLS=OFF \
  -DBUILD_MINI_VIEWER=OFF \
  -DBUILD_MINI_WITH_OPENTHREADS=OFF \

  make -j5
}

package() {
  cd ${pkgname}/build

  make DESTDIR=${pkgdir} install || return 1  
}
