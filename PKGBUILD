# Maintainer: Christian Krause ("wookietreiber") <kizkizzbangbang@googlemail.com>

pkgname=beagle-lib
pkgver=3.1.2
pkgrel=4
epoch=1
pkgdesc="general purpose library for evaluating the likelihood of sequence evolution on trees"
arch=('i686' 'x86_64')
url="https://github.com/beagle-dev/beagle-lib"
license=('GPL3')
depends=('libtool')
optdepends=('cuda-toolkit: for CUDA support'
            'java-runtime: for Java support'
            'libcl: for OpenCL support')
makedepends=('make' 'java-environment')
conflicts=('beagle-lib-git' 'beagle-lib-svn')
source=("https://github.com/beagle-dev/beagle-lib/archive/v${pkgver}.tar.gz")
sha512sums=('0dacede40a51d8bb67c149d635b0f0fb5c27daf68b0d4a63d4109805eb1e16e1a408c725b99903cc615b60ba44723df9b6431815b6993e88783fce1aa88f29ea')

prepare() {
  cd $srcdir/$pkgname-$pkgver

  ./autogen.sh
}

build() {
  cd $srcdir/$pkgname-$pkgver

  export JAVA_HOME=/usr/lib/jvm/default

  ./configure \
    --prefix=/usr \
    --enable-openmp

  make
}

check() {
  cd $srcdir/$pkgname-$pkgver

  make check
}

package() {
  cd $srcdir/$pkgname-$pkgver

  make DESTDIR=$pkgdir install
}
