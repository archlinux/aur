pkgname=openturns
pkgver=1.27.3
pkgrel=1
pkgdesc="Uncertainty treatment library"
license=(LGPL-3.0-or-later)
arch=('x86_64')
url="http://www.openturns.org/"
depends=('libxml2' 'onetbb' 'libcuba' 'python-matplotlib' 'python-psutil' 'python-dill' 'nlopt' 'cminpack' 'ceres-solver-lgpl' 'coin-or-bonmin' 'dlib' 'hdf5' 'primesieve' 'pagmo' 'highs')
makedepends=('cmake' 'swig' 'boost' 'spectra' 'nanoflann' 'mold')
source=("https://github.com/openturns/openturns/archive/v$pkgver.tar.gz")
sha256sums=('6cd10e65682a09a5c8f7b40e3b4926d64fc93dcdff19c0e432ec843886cc1bc2')

build() {
  cd openturns-$pkgver
  cmake -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_SKIP_INSTALL_RPATH=ON \
        -DCMAKE_LINKER_TYPE=MOLD \
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

