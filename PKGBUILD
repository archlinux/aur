pkgname=libfile
pkgver=1.0.2
pkgrel=4
pkgdesc="File library for checking types and architecture."
arch=('x86_64')
url="https://github.com/coolguy-09/libfile"
license=('MIT')
depends=('glibc')
makedepends=('gcc' 'make' 'binutils')
source=("https://github.com/coolguy-09/libfile/archive/refs/tags/v$pkgver.tar.gz")
md5sums=('SKIP')
options=('strip' 'staticlibs')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  chmod +x configure
  ./configure ARCH=x86_64
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -Dm755 libfile.so.1.0.2 "$pkgdir/usr/lib/libfile.so.1.0.2"
  ln -sf libfile.so.1.0.2 "$pkgdir/usr/lib/libfile.so.1"
  ln -sf libfile.so.1 "$pkgdir/usr/lib/libfile.so"
  install -Dm644 libfile.a "$pkgdir/usr/lib/libfile.a"
  install -Dm644 include/file.h "$pkgdir/usr/include/file.h"
}
