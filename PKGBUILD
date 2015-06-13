# Maintainer: Christian Krause ("wookietreiber") <kizkizzbangbang@googlemail.com>

pkgname=beagle-lib

pkgver=2.1.2
pkgrel=1
epoch=1
pkgdesc="general purpose library for evaluating the likelihood of sequence evolution on trees"
arch=('i686' 'x86_64')
url="https://code.google.com/p/beagle-lib/"
license=('GPL3')
depends=('libtool')
optdepends=('cuda-toolkit: for CUDA support'
            'java-environment: for Java support'
            'libcl: for OpenCL support')
makedepends=('svn')

source=("$pkgname-$pkgver::svn+http://beagle-lib.googlecode.com/svn/tags/beagle_release_${pkgver//./_}")

md5sums=('SKIP')

prepare() {
  cd $srcdir/$pkgname-$pkgver

  ./autogen.sh
}

build() {
  cd $srcdir/$pkgname-$pkgver

  ./configure \
    --prefix=/usr \
    --enable-openmp

  make
}

package() {
  cd $srcdir/$pkgname-$pkgver

  make DESTDIR=$pkgdir install
}
