# Maintainer: Lukas Jirkovsky <l.jirkovsky@gmail.com>
pkgname=enblend-hg
pkgver=858.0e4ddfb944e6
pkgrel=1
pkgdesc="Intelligent blend tool for overlapping pictures"
arch=('i686' 'x86_64')
license=('GPL')
conflicts=('enblend' 'enblend-enfuse')
provides=('enblend' 'enblend-enfuse')
replaces=('enblend-cvs' 'enblend-staging-bzr')
url="http://enblend.sourceforge.net/"
depends=('libgl' 'openexr' 'glew' 'gsl' 'freeglut' 'lcms2' 'boost-libs' 'vigra')
makedepends=('mercurial' 'cmake' 'boost' 'imagemagick')
source=('hg+http://enblend.hg.sourceforge.net:8000/hgroot/enblend')
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/enblend"
  echo $(hg identify -n).$(hg identify -i)
}

build() {
  cd "$srcdir/enblend"

  sed -i 's|doc/enblend|share/doc/enblend|' CMakeLists.txt
  cmake -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=Release \
    -DENABLE_OPENMP=ON \
    -DENABLE_IMAGECACHE=OFF \
    -DENABLE_GPU=ON \
    .
  make
}

package() {
  cd "$srcdir/enblend"
  make DESTDIR="$pkgdir" install
}
