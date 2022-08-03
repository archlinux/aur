# Maintainer: Christian Krause ("wookietreiber") <kizkizzbangbang@googlemail.com>

pkgname=beagle-lib
pkgver=4.0.0
pkgrel=9
pkgdesc="general purpose library for evaluating the likelihood of sequence evolution on trees"
arch=('i686' 'x86_64')
url="https://github.com/beagle-dev/beagle-lib"
license=('GPL3')
depends=('libtool')
optdepends=('java-runtime: for Java support')
makedepends=('cmake' 'make' 'java-environment')
provides=('beagle-lib')
conflicts=('beagle-lib-all' 'beagle-lib-opencl' 'beagle-lib-cuda')
source=("https://github.com/beagle-dev/beagle-lib/archive/v${pkgver}.tar.gz")
sha512sums=('41f390dd7180584b1ca0b2fc798a88aa718f03ea0d40d9831178f0c14c303255470a84a45df580a2b22307e905230af628af8671b70fda4330d67963e114a06e')

prepare() {
  cd $srcdir/$pkgname-$pkgver
  test -d build || mkdir build
}

build() {
  cd $srcdir/$pkgname-$pkgver
  cd build
  export JAVA_HOME=/usr/lib/jvm/default
  cmake -DBUILD_CUDA=ON -DBUILD_OPENCL=ON -DCMAKE_INSTALL_PREFIX:PATH=$pkgdir/usr ..
}

package() {
  cd $srcdir/$pkgname-$pkgver/build
  make install
}
