# Maintainer: Christian Krause ("wookietreiber") <kizkizzbangbang@googlemail.com>

pkgname=beagle-lib-git
pkgver=r1053.6ba09fa
pkgrel=1
pkgdesc="general purpose library for evaluating the likelihood of sequence evolution on trees"
arch=('i686' 'x86_64')
url="https://github.com/beagle-dev/beagle-lib"
license=('GPL3')
depends=('libtool')
optdepends=('cuda-toolkit: for CUDA support'
            'java-runtime: for Java support'
            'libcl: for OpenCL support')
makedepends=('java-environment')
provides=('beagle-lib')
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

  export JAVA_HOME=/usr/lib/jvm/default

  ./configure \
    --prefix=/usr \
    --enable-openmp

  make
}

check() {
  cd $srcdir/$pkgname

  make check
}

package() {
  cd $srcdir/$pkgname

  make DESTDIR=$pkgdir install
}
