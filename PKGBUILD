pkgname=mixmod
pkgver=3.1.0
pkgrel=1
pkgdesc="Model-Based supervised and unsupervised classification on qualitative and quantitative data."
arch=('i686' 'x86_64')
url="http://www.mixmod.org"
license=(GPL)
depends=('gcc-libs')
makedepends=('cmake' 'gcc')
source=("http://www.mixmod.org/IMG/tgz/mixmod_3-1-0_src.tgz"
        'mixmod3.patch')
md5sums=('SKIP'
         '480c9e761c74f0218fc439ba924227f1')

prepare () {
  cd "$srcdir/mixmodLib_3_1_0"
  rm -f UseMixmod.cmake MixmodConfig.cmake.in
  patch -p1 -i "$srcdir"/mixmod3.patch
}

build () {
  cd "$srcdir/mixmodLib_3_1_0"
  cmake -DCMAKE_INSTALL_PREFIX=/usr . 
  make
}

package () {
  cd "$srcdir/mixmodLib_3_1_0"
  make install DESTDIR="$pkgdir"
}
