# Maintainer: Laurent Carlier <lordheavym@gmail.com>

pkgname=libclc
pkgver=0.0.1.231373
pkgrel=1
pkgdesc="Library requirements of the OpenCL C programming language"
arch=('any')
url="http://libclc.llvm.org/"
license=('MIT')
makedepends=('clang' 'python2')
options=('staticlibs')
source=(https://sources.archlinux.org/other/packages/libclc/$pkgname-$pkgver.src.tar.xz)
md5sums=('e7b0767cd9f6c171ba4990df5d41b2aa')

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

