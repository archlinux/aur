# Maintainer: Laurent Carlier <lordheavym@gmail.com>

pkgname=libclc
pkgver=0.2.0+360+3ab9165
pkgrel=1
pkgdesc="Library requirements of the OpenCL C programming language"
arch=('any')
url="http://libclc.llvm.org/"
license=('MIT')
makedepends=('clang' 'llvm' 'python2' 'git')
options=('staticlibs')
source=('git+http://llvm.org/git/libclc.git#commit=3ab9165')
md5sums=('SKIP')

pkgver() {
  cd libclc

  echo 0.2.0+$(git rev-list --count HEAD)+$(git describe --always)
  #git describe --long | sed 's/-/+/g'
}

build() {
  cd libclc
  
  sed -i 's/"python < $in >/sys.executable + " < $in >/g' configure.py
  
  python2 ./configure.py --prefix=/usr
  make
}

package() {
  cd libclc
  
  make install DESTDIR="$pkgdir"
  install -Dm644 LICENSE.TXT "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

