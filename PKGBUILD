# Maintainer: Christian Krause ("wookietreiber") <kizkizzbangbang@googlemail.com>

pkgname=beagle-lib
pkgver=4.2.0
pkgrel=1
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
sha512sums=('fa58af50fbf759c41366083bfd213e3326afe126431b5777794f02073a78939cc364d7560b319678c6bf4082d5fa5c1dbc4e4f6a196ce2e6c6ad7023f1217219')

prepare() {
  cd $srcdir/$pkgname-$pkgver
  test -d build || mkdir build
}

build() {
  cd $srcdir/$pkgname-$pkgver
  cd build
  export JAVA_HOME=/usr/lib/jvm/default
  export CFLAGS="-std=c11"
  cmake -DBUILD_CUDA=ON -DBUILD_OPENCL=ON -DCMAKE_INSTALL_PREFIX:PATH=$pkgdir/usr ..
}

package() {
  cd $srcdir/$pkgname-$pkgver/build
  make install
}
