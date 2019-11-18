# Maintainer: Alexander F. Rødseth <xyproto@archlinux.org>

pkgname=o
pkgver=2.8.0
pkgrel=1
pkgdesc='Small, fast and limited text editor'
arch=(x86_64)
url='https://github.com/xyproto/o'
license=(BSD)
makedepends=(git go)
source=("git+$url#tag=$pkgver")
sha256sums=('SKIP')

build() {
  cd "$pkgname"
  #go build -buildmode=pie -gccgoflags="-s -w $LDFLAGS"
  go build -buildmode=pie -gcflags="all=-trimpath=$PWD" -asmflags "all=-trimpath=$PWD" -ldflags "-s -w -extldflags $LDFLAGS"
}

package() {
  install -Dm755 $pkgname/o "$pkgdir/usr/bin/o"
  install -Dm644 $pkgname/LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim: ts=2 sw=2 et:
