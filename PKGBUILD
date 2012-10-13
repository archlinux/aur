# Maintainer: Daniel Wallace <danielwallace at gtmanfred dot com>
pkgname=mlpack
pkgver=1.0.3
pkgrel=1
pkgdesc="a scalable c++ machine learning library"
arch=('i686' 'x86_64')
url="http://www.mlpack.org"
license=('LGPLv3+')
depends=('armadillo>=2.4.0' 'boost' 'lapack' 'libxml2')
makedepends=('cmake>=2.8.0' 'txt2man')
source=("http://www.$pkgname.org/files/${pkgname}-${pkgver}.tar.gz"
        "http://www.$pkgname.org/files/range_search_install.patch"
        "http://www.$pkgname.org/files/getkernelmatrix_definition.patch"
        "http://www.$pkgname.org/files/no_sparse_tests.patch"
        "http://www.$pkgname.org/files/fully_qualified_as_scalar.patch")

md5sums=('ecf9279fc8e92836aeb838c127ab79f6'
         '352cdbadf79e6bc17f71c536b0113dae'
         '81d7bea820041a7caa4b2683e536ee1f'
         '44991787106e33443af03c225ab92a3f'
         'e79dc29cbb5e0575dbc3110c46650e50')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  #patch -Np1 -i "$srcdir/${source[1]##*/}"
  #patch -Np1 -i "$srcdir/${source[2]##*/}"
  #patch -Np1 -i "$srcdir/${source[3]##*/}"
  #patch -Np1 -i "$srcdir/${source[4]##*/}"

  cmake -D CMAKE_INSTALL_PREFIX="$pkgdir/" -D DEBUG=OFF -D PROFILE=OFF .
  make
}

check() {
  cd "$srcdir/$pkgname-$pkgver"

  make mlpack_test
  bin/mlpack_test
} 

package() {
  cd "$srcdir/$pkgname-$pkgver"
  
  make install
}

# vim:set ts=2 sw=2 et:
md5sums=('9c61f73e2c479315f8270b205315df23'
         '352cdbadf79e6bc17f71c536b0113dae'
         '81d7bea820041a7caa4b2683e536ee1f'
         '44991787106e33443af03c225ab92a3f'
         'e79dc29cbb5e0575dbc3110c46650e50')
