# Maintainer: Alexander F. Rødseth <xyproto@archlinux.org>

pkgname=palgen
pkgver=1.6.1
pkgrel=1
pkgdesc='Extract palettes and convert PNG files from True color to indexed'
arch=(x86_64)
url='https://github.com/xyproto/palgen'
license=(BSD-3-Clause)
makedepends=(git go)
source=("git+$url#tag=v$pkgver")
b2sums=('15d9208adbd4715cbe45e78853f166436621c0cbedc6d60122266dc628f4060ca4463dfb152ce1f3b1b99b54ce6f67b53ea6d534dc08d39338bcbe1ba313a4c8')

build() {
  export BUILDFLAGS='-mod=vendor -buildmode=pie -trimpath -ldflags="-s -w"'
  make -C $pkgname
}

package() {
  DESTDIR="$pkgdir" PREFIX="/usr" make -C $pkgname install
  install -Dm644 $pkgname/LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
