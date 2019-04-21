# Maintainer: Lukas Jirkovsky <l.jirkovsky@gmail.com>
pkgname=enblend-hg
pkgver=1517.8849e927f614
pkgrel=1
pkgdesc="Intelligent blend tool for overlapping pictures"
arch=('i686' 'x86_64')
license=('GPL')
conflicts=('enblend' 'enblend-enfuse')
provides=('enblend' 'enblend-enfuse')
url="http://enblend.sourceforge.net/"
depends=('boost-libs' 'gsl' 'lcms2' 'vigra')
makedepends=('mercurial' 'cmake' 'boost')
source=("$pkgname::hg+http://hg.code.sf.net/p/enblend/code")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  echo $(hg identify -n).$(hg identify -i)
}

build() {
  cd "$srcdir/$pkgname"

  sed -i 's|doc/enblend|share/doc/enblend|' CMakeLists.txt
  cmake -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=Release \
    -DENABLE_OPENMP=ON \
    .
  make
}

package() {
  cd "$srcdir/$pkgname"
  make DESTDIR="$pkgdir" install
}
