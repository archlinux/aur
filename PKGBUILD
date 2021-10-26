pkgname=openturns
pkgver=1.18rc1
pkgrel=1
pkgdesc="Uncertainty treatment library"
license=('LGPL')
arch=('x86_64')
url="http://www.openturns.org/"
depends=('libxml2' 'tbb' 'hmat-oss' 'python-matplotlib' 'python-psutil' 'python-dill' 'nlopt' 'cminpack' 'ceres-solver' 'coin-or-bonmin' 'dlib' 'hdf5' 'primesieve')
makedepends=('cmake' 'swig' 'boost' 'spectra')
source=("https://github.com/openturns/openturns/archive/v$pkgver.tar.gz")
sha256sums=('a8d1bac3c6917db775e38a91a4eb070b3773f5a2db7020a47c3326bb4f27d3cd')

build() {
  cd openturns-$pkgver
  cmake -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_SKIP_INSTALL_RPATH=ON \
        -DOPENTURNS_SYSCONFIG_PATH=/etc \
        -DUSE_SPHINX=OFF \
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

