# Maintainer: Adrian Perez <adrian@perezdecastro.org>
pkgname=9pfuse
pkgver=1
pkgrel=1
pkgdesc="The 9p protocol implementation for FUSE from Plan9 Port"
arch=(x86_64 i686)
url="https://github.com/aperezdc/9pfuse"
license=('GPL')
depends=(fuse)
source=("https://github.com/downloads/aperezdc/$pkgname/$pkgname-$pkgver.tar.xz")
md5sums=('5ee18a5473c1e876739d9a7b45d26de7')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  make

  # Compress man page, the Makefile won't do it
  gzip -9c 9pfuse.4 > 9pfuse.4.gz
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -m 755 -d "$pkgdir/usr/bin"
  install -m 755 -t "$pkgdir/usr/bin" 9pfuse
  install -m 755 -d "$pkgdir/usr/share/man/man4"
  install -m 644 -t "$pkgdir/usr/share/man/man4" 9pfuse.4.gz
}

# vim:set ts=2 sw=2 et:
