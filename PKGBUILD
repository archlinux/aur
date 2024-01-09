pkgname=openturns
pkgver=1.22
pkgrel=1
pkgdesc="Uncertainty treatment library"
license=('LGPL')
arch=('x86_64')
url="http://www.openturns.org/"
depends=('libxml2' 'onetbb' 'hmat-oss' 'python-matplotlib' 'python-psutil' 'python-dill' 'nlopt' 'cminpack' 'ceres-solver' 'coin-or-bonmin' 'dlib' 'hdf5' 'primesieve' 'pagmo')
makedepends=('cmake' 'swig' 'boost' 'spectra')
source=("https://github.com/openturns/openturns/archive/v$pkgver.tar.gz")
sha256sums=('487f7fc00f02eb91d264c8c9d78c2abba505ac6aaa5bc0328c04dddbe6d58741')

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

