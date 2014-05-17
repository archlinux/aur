# Maintainer: Laurent Carlier <lordheavym@gmail.com>

pkgname=libclc
pkgver=0.0.1.207685
pkgrel=1
pkgdesc="Library requirements of the OpenCL C programming language"
arch=('i686' 'x86_64')
url="http://libclc.llvm.org/"
license=('MIT')
makedepends=('clang' 'svn' 'python2')
options=('staticlibs')
source=('libclc::svn+http://llvm.org/svn/llvm-project/libclc/trunk#revision=207685')
md5sums=(SKIP)

build() {
  cd libclc
  
  sed -i 's/"python < $in >/sys.executable + " < $in >/g' configure.py
#  sed -i 's/python < $in >/python2 < $in >/g' configure.py
  
  python2 ./configure.py --prefix=/usr
  make
}

package() {
  cd libclc
  
  make install DESTDIR="$pkgdir"
  install -Dm644 LICENSE.TXT "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

