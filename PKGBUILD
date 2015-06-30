# Maintainer: Yuval Adam <yuv dot adm at gmail dot com> PGP-Key: CC2115C12D99D2F0 

pkgname=openbr-git
pkgver=20140903
pkgrel=2
pkgdesc="A communal biometrics framework supporting the development of open algorithms and reproducible evaluations."
arch=('any')
url="http://openbiometrics.org/"
license=('Apache')
depends=('qt5-base' 'qt5-svg' 'opencv')
makedepends=('git' 'cmake')
provides=('openbr')
source=('git+https://github.com/biometrics/openbr.git')
md5sums=('SKIP')
_gitname=openbr

pkgver() {
  cd $_gitname
  echo $(git describe --always | sed 's/-/./g')
}

build() {
  cd $_gitname 

  msg "Pulling required submodules (might take some time...)"
  git submodule init
  git submodule update

  mkdir build 
  cd build
  cmake -DCMAKE_BUILD_TYPE=Release ../
  make
}

package() {
  cd $_gitname/build 
  make DESTDIR=${pkgdir} install
}

# vim:set ts=2 sw=2 et:

