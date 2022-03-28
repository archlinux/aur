# Maintainer: Alexander F. Rødseth <xyproto@archlinux.org>

pkgname=palgen
pkgver=1.0.0
pkgrel=1
pkgdesc='Utilities for extracting palettes and converting PNG files from truecolor to indexed'
arch=(x86_64)
url='https://github.com/xyproto/palgen'
license=(BSD)
makedepends=(git go upx)
source=("git+$url#commit=8c4bbcbf4bdb6be2d6afc32605586b5090ace22c") # tag: v1.0.0
b2sums=('SKIP')

build() {
  make -C $pkgname
}

package() {
  DESTDIR="$pkgdir" make -C $pkgname install
  find "$pkgdir/usr/bin/" -executable -type f -exec upx -q --no-progress {} >/dev/null \;
  install -Dm644 $pkgname/LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
