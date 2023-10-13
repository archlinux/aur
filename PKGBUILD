# Maintainer: Christian Krause ("wookietreiber") <kizkizzbangbang@googlemail.com>

pkgname=beagle-lib
pkgver=4.0.1
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
sha512sums=('39476c791b0445d582f723b08bfd6d5e08a858961fce1b5240bc20687c3228e246b3c6a53dc85824a3121b2823a6fcf7b110325cac9e645014f00536755093ba')

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
