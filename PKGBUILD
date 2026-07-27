# Maintainer: Alexander F. Rødseth <xyproto@archlinux.org>

pkgname=palgen
pkgver=1.7.3
pkgrel=1
pkgdesc='Extract palettes and convert PNG files from True color to indexed'
arch=(x86_64)
url='https://github.com/xyproto/palgen'
license=(BSD-3-Clause)
makedepends=(git go)
source=("git+$url#tag=v$pkgver")
b2sums=('68ac3b9ceac9c99d10623ba3c206419df7fdcd881b1440071a20f9f6d7c8c63c851c8ecc124cb25226e82395bd78df6e22eb1188fd4516e26634cf9c47d0911b')

build() {
  export BUILDFLAGS='-mod=vendor -buildmode=pie -trimpath -ldflags="-s -w"'
  make -C $pkgname
}

package() {
  DESTDIR="$pkgdir" PREFIX="/usr" make -C $pkgname install
  install -Dm644 $pkgname/LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
