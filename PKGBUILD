# Maintainer: Allen Zhong <moeallenz@gmail.com>
# Contributor: shad0w73 <shad0w73@freenet.de>

_basename=gperftools
pkgname=lib32-$_basename
pkgver=2.1
pkgrel=1
pkgdesc="Fast, multi-threaded malloc() and nifty performance analysis tools (32-bit)"
arch=('x86_64')
url="http://code.google.com/p/gperftools/"
license=('BSD')
depends=('gperftools' 'lib32-gcc-libs')
makedepends=('gcc-multilib')
source=("http://$_basename.googlecode.com/files/$_basename-$pkgver.tar.gz")
sha256sums=('f3ade29924f89409d8279ab39e00af7420593baa4941c318db42e70ead7e494f')

build() {
  export CC='gcc -m32'
  export CXX='g++ -m32'

  cd "$_basename-$pkgver"

  ./configure --prefix=/usr --libdir=/usr/lib32 --enable-frame-pointers
  make
}

package() {
  cd "$_basename-$pkgver"

  # not needed in 32-bit package
  make DESTDIR="$pkgdir" install
  rm -rf "$pkgdir"/usr/{bin,include,share}

  mkdir -p "$pkgdir/usr/share/licenses"
  ln -s $_basename "$pkgdir/usr/share/licenses/$pkgname"
}
