# Maintainer: Laurent Carlier <lordheavym@gmail.com>

pkgname=libclc
pkgver=0.2.0+585+9f6204e
pkgrel=1
pkgdesc="Library requirements of the OpenCL C programming language"
arch=('any')
url="https://libclc.llvm.org/"
license=('MIT')
makedepends=('clang' 'llvm' 'python' 'git')
options=('staticlibs')
source=('git+https://llvm.org/git/libclc.git#commit=9f6204e')
md5sums=('SKIP')

pkgver() {
  cd libclc

  echo 0.2.0+$(git rev-list --count HEAD)+$(git describe --always)
}

build() {
  cd libclc
   ./configure.py --prefix=/usr
  make
}

package() {
  cd libclc
  
  make install DESTDIR="$pkgdir"
  install -Dm644 LICENSE.TXT "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

