# Maintainer: Gustavo Costa <xfgusta@gmail.com>

pkgname=strace-with-colors
_pkgname=strace
pkgver=5.17
pkgrel=3
pkgdesc='A diagnostic, debugging and instructional userspace tracer (with colors)'
arch=(x86_64)
url='https://strace.io/'
license=(BSD)
depends=(perl libunwind)
conflicts=($_pkgname)
provides=($_pkgname)
source=("https://github.com/strace/strace/releases/download/v$pkgver/strace-$pkgver.tar.xz"
        "$pkgname.patch")
sha1sums=('4e0622ec2f1551f96ba6abb0145737b91fda4509'
          'SKIP')

prepare() {
  patch -d "$_pkgname-$pkgver" -p1 -i ../$pkgname.patch
}

build() {
  cd $_pkgname-$pkgver
  ./configure --prefix=/usr --with-libunwind --enable-mpers=no
  make
}

package() {
  cd $_pkgname-$pkgver
  make DESTDIR="$pkgdir" install
  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
}
