# Maintainer: Christian Krause ("wookietreiber") <kizkizzbangbang@googlemail.com>

pkgname=beagle-lib-git
pkgver=r1040.c455af1
pkgrel=1
pkgdesc="general purpose library for evaluating the likelihood of sequence evolution on trees"
arch=('i686' 'x86_64')
url="https://github.com/beagle-dev/beagle-lib"
license=('GPL3')
depends=('libtool')
optdepends=('cuda-toolkit: for CUDA support'
            'java-environment: for Java support'
            'libcl: for OpenCL support')
conflicts=('beagle-lib' 'beagle-lib-svn')
source=("$pkgname::git+https://github.com/beagle-dev/beagle-lib")
md5sums=('SKIP')

pkgver() {
  cd $srcdir/$pkgname

  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd $srcdir/$pkgname

  ./autogen.sh
}

build() {
  cd $srcdir/$pkgname

  ./configure \
    --prefix=/usr \
    --enable-openmp \
    --without-opencl \
    --with-jdk=/usr/lib/jvm/java-8-openjdk

  make
}

package() {
  cd $srcdir/$pkgname

  make DESTDIR=$pkgdir install
}
