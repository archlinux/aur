pkgname=openturns
pkgver=1.25
pkgrel=1
pkgdesc="Uncertainty treatment library"
license=('LGPL')
arch=('x86_64')
url="http://www.openturns.org/"
depends=('libxml2' 'onetbb' 'libcuba' 'python-matplotlib' 'python-psutil' 'python-dill' 'nlopt' 'cminpack' 'ceres-solver' 'coin-or-bonmin' 'dlib' 'hdf5' 'primesieve' 'pagmo')
makedepends=('cmake' 'swig' 'boost' 'spectra' 'nanoflann' 'mold')
source=("https://github.com/openturns/openturns/archive/v$pkgver.tar.gz")
sha256sums=('d9606f25824a84233b2ccf07e0d03716e387453a4be26fdd031bd0d47458d045')

build() {
  cd openturns-$pkgver
  cmake -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_SKIP_INSTALL_RPATH=ON \
        -DCMAKE_LINKER_TYPE=MOLD \
        -DBLA_VENDOR=Generic \
        -DOPENTURNS_SYSCONFIG_PATH=/etc \
        -DCMAKE_UNITY_BUILD=ON -DCMAKE_UNITY_BUILD_BATCH_SIZE=32 \
        -DSWIG_COMPILE_FLAGS="-O1" \
        -DUSE_CERES=OFF \
        .
  make
}

package() {
  cd openturns-$pkgver
  make DESTDIR="$pkgdir" install
  install -d "$pkgdir"/usr/share/licenses/$pkgname
  install -m644 "$srcdir"/openturns-$pkgver/COPYING* $pkgdir/usr/share/licenses/$pkgname
}

