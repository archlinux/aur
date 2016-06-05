# Maintainer: Martin Weinelt <hexa@darmstadt.ccc.de>
 
pkgname=quaternion-git
pkgver=06fffd1
pkgrel=1
pkgdesc="Qt5-based IM client for the Matrix protocol"
arch=('any')
url="https://github.com/Fxrh/Quaternion"
license=('LGPL')
depends=('qt5-base' 'qt5-declarative' 'qt5-quickcontrols')
makedepends=('git')
provides=('quaternion')
conflicts=('quaternion')
source=('git+https://github.com/fxrh/quaternion.git')
md5sums=('SKIP')
_gitname=quaternion
 
pkgver () {
  cd $_gitname
  echo $(git describe --always | sed 's/-/./g')
}

prepare() {
  cd $_gitname
  git remote set-url origin https://github.com/fxrh/quaternion.git
  git submodule update --init --recursive
}
 
build() {
  mkdir $_gitname/build || true
  cd $_gitname/build
  cmake ..
  make
}
 
package() {
  cd $_gitname/build
  install -Dm755 "quaternion" -t "$pkgdir/usr/bin/"
}

