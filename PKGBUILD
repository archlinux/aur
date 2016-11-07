# Maintainer: Christian Krause ("wookietreiber") <kizkizzbangbang@googlemail.com>

pkgname=beagle-lib
pkgver=2.1.2
pkgrel=3
epoch=1
pkgdesc="general purpose library for evaluating the likelihood of sequence evolution on trees"
arch=('i686' 'x86_64')
url="https://github.com/beagle-dev/beagle-lib"
license=('GPL3')
depends=('libtool')
optdepends=('cuda-toolkit: for CUDA support'
            'java-runtime: for Java support'
            'libcl: for OpenCL support')
makedepends=('java-environment')
conflicts=('beagle-lib-git' 'beagle-lib-svn')
source=("https://github.com/beagle-dev/beagle-lib/archive/beagle_release_${pkgver//./_}.tar.gz")
md5sums=('1107614e86f652f8ee45c1c92f2af3d4')

prepare() {
  cd $srcdir/beagle-lib-beagle_release_${pkgver//./_}

  ./autogen.sh
}

build() {
  cd $srcdir/beagle-lib-beagle_release_${pkgver//./_}

  export JAVA_HOME=/usr/lib/jvm/default

  ./configure \
    --prefix=/usr \
    --enable-openmp

  make
}

check() {
  cd $srcdir/beagle-lib-beagle_release_${pkgver//./_}

  make check
}

package() {
  cd $srcdir/beagle-lib-beagle_release_${pkgver//./_}

  make DESTDIR=$pkgdir install
}
