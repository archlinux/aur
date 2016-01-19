# Maintainer: Veeti Paananen <veeti.paananen@rojekti.fi>
pkgname=cmark
pkgver=0.24.1
pkgrel=1
pkgdesc="CommonMark parsing and rendering library and program in C"
arch=('i686' 'x86_64')
url="https://github.com/jgm/cmark"
license=('custom:BSD2')
depends=('glibc')
makedepends=('cmake' 'python')
source=("https://github.com/jgm/cmark/archive/${pkgver}.tar.gz#/${pkgname}-${pkgver}.tar.gz")
sha256sums=('7566d307ffff07567faa0381b248f60164eddcc0e0f5eb6e27d6f58e1269ab2a')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  mkdir -p build/
  cd build/
  cmake -DCMAKE_INSTALL_PREFIX="/usr" ..
  make
}

check() {
  cd "$srcdir/$pkgname-$pkgver/build/"

  make test
}

package() {
  cd "$srcdir/$pkgname-$pkgver/build/"

  make install DESTDIR="$pkgdir/"
  install -D -m 644 ../COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}
