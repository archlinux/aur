pkgname=openturns
pkgver=1.15
pkgrel=1
pkgdesc="Uncertainty treatment library"
license=('LGPL')
arch=('x86_64')
url="http://www.openturns.org/"
depends=('libxml2' 'tbb' 'hmat-oss' 'python-matplotlib' 'python-psutil' 'nlopt' 'cminpack' 'ceres-solver' 'dlib' 'coin-or-bonmin')
makedepends=('cmake' 'swig' 'boost' 'spectra')
backup=('etc/openturns/openturns.conf')
source=("https://github.com/openturns/openturns/archive/v$pkgver.tar.gz")
sha256sums=('116f30b36f5c1df15cffbbfa4b5dc103d42e746d85d5b9f9c7c3bcc02155934a')

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

