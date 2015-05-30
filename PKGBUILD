pkgname=liquidfun
pkgver=1.1.0
pkgrel=2
pkgdesc="A 2D rigid-body and fluid simulation C++ library for games based upon Box2D"
arch=('i686' 'x86_64')
url="https://google.github.io/liquidfun/"
license=('box2d')
depends=('libglapi' 'glu')
makedepends=('cmake' 'doxygen')
provides=('box2d')
conflicts=('box2d')
replaces=('box2d')
source=("https://github.com/google/liquidfun/releases/download/v1.1.0/liquidfun-1.1.0.tar.gz")
md5sums=('0a81c5e0f45b32f73dd064cc87fc0ba2')

build() {
  cd "$srcdir/liquidfun/Box2D"

  mkdir build
  cd build
  cmake ..                        \
      -DBOX2D_INSTALL=ON          \
      -DBOX2D_INSTALL_DOC=ON      \
      -DBOX2D_BUILD_SHARED=ON     \
      -DBOX2D_BUILD_STATIC=OFF    \
      -DBOX2D_BUILD_EXAMPLES=OFF  \
      -DBOX2D_BUILD_UNITTESTS=OFF \
      -DCMAKE_INSTALL_PREFIX=/usr &&
  make

  cd ../Documentation
  doxygen
}

package() {
  cd "$srcdir/liquidfun/Box2D"
  cd build

  make DESTDIR=${pkgdir} install
}

# vim:set ts=2 sw=2 et: 
