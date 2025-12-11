pkgname=openturns
pkgver=1.26
pkgrel=1
pkgdesc="Uncertainty treatment library"
license=(LGPL-3.0-or-later)
arch=('x86_64')
url="http://www.openturns.org/"
depends=('libxml2' 'onetbb' 'libcuba' 'python-matplotlib' 'python-psutil' 'python-dill' 'nlopt' 'cminpack' 'ceres-solver-lgpl' 'coin-or-bonmin' 'dlib' 'hdf5' 'primesieve' 'pagmo' 'highs')
makedepends=('cmake' 'swig' 'boost' 'spectra' 'nanoflann' 'mold')
source=("https://github.com/openturns/openturns/archive/v$pkgver.tar.gz")
sha256sums=('624bd45f89ab3afe1931cb07f8c5398e6983faa40a1d92a81b04006f45b66147')

build() {
  cd openturns-$pkgver
  cmake -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_SKIP_INSTALL_RPATH=ON \
        -DCMAKE_LINKER_TYPE=MOLD \
        -DBLA_VENDOR=Generic \
        -DOPENTURNS_SYSCONFIG_PATH=/etc \
        -DCMAKE_UNITY_BUILD=ON -DCMAKE_UNITY_BUILD_BATCH_SIZE=32 \
        -DSWIG_COMPILE_FLAGS="-O1" \
        .
  make
}

package() {
  cd openturns-$pkgver
  make DESTDIR="$pkgdir" install
  install -d "$pkgdir"/usr/share/licenses/$pkgname
  install -m644 "$srcdir"/openturns-$pkgver/COPYING* $pkgdir/usr/share/licenses/$pkgname
}

