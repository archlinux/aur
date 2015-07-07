# Maintainer: Christian Krause ("wookietreiber") <kizkizzbangbang@googlemail.com>

pkgname=shrimp
pkgver=2.2.3
pkgrel=1
pkgdesc="SHort Read Mapping Package"
arch=('i686' 'x86_64')
url="http://compbio.cs.toronto.edu/shrimp/"
license=('custom')
depends=('gcc-libs' 'zlib')
source=("$pkgname-$pkgver.tar.gz::http://compbio.cs.toronto.edu/shrimp/releases/SHRiMP_${pkgver//./_}.src.tar.gz")
md5sums=('c69a5e30f2f81045c5ff84c4e3f318d5')

prepare() {
  cd $srcdir/SHRiMP_${pkgver//./_}

  sed -e 's|LDFLAGS=|LDFLAGS += |' \
      -i Makefile
}

build() {
  cd $srcdir/SHRiMP_${pkgver//./_}

  export CXXFLAGS+=" -fopenmp"

  make
}

package() {
  cd $srcdir/SHRiMP_${pkgver//./_}

  for file in bin/* ; do
    install -Dm755 $file $pkgdir/usr/bin/$(basename $file)
  done

  install -Dm644 LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE
}
