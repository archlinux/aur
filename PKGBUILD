# Maintainer: Jakob Gahde <j5lx@fmail.co.uk>

_pkgname=glportal
pkgname=${_pkgname}-git
pkgver=v0.0.5.605.gd5e4d47
pkgrel=1
pkgdesc="OpenGL puzzle game inspired by portal."
arch=('i686' 'x86_64')
url="http://glportal.de/"
license=('custom')
depends=('glew' 'assimp' 'sdl2' 'sdl2_mixer' 'tinyxml')
makedepends=('git' 'cmake' 'unittestpp')
provides=("${_pkgname}=${pkgver}")
conflicts=("${_pkgname}")
source=("git+https://github.com/${_pkgname}/${_pkgname}.git")
md5sums=('SKIP')

pkgver() {
  cd $srcdir/$_pkgname
  echo $(git describe --always | sed 's/-/./g')
}

build() {
  cd $srcdir/$_pkgname

  mkdir build && cd build
  cmake -DCMAKE_INSTALL_PREFIX=/usr ..
  make
}

check() {
  cd $srcdir/$_pkgname/build

  make test
}

package() {
  cd $srcdir/$_pkgname/build
  
  make install DESTDIR=$pkgdir
  install -Dm644 "../LICENCE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENCE"
}
