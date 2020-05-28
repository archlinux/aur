# Maintainer: Alexander F. Rødseth <xyproto@archlinux.org>

pkgname=cupholder
pkgver=1.1.0
pkgrel=1
pkgdesc='Eject the CD tray (locally or remotely)'
arch=(x86_64)
url='https://github.com/xyproto/cupholder'
license=(BSD)
makedepends=(git go-pie)
source=("git+$url#commit=8a78d2455627909731b16b7a89e903fcdbf6731d") # tag: v1.1.0
sha256sums=('SKIP')
options=(!strip)

build() {
  cd $pkgname
  go build -buildmode=pie -gcflags="all=-trimpath=$PWD" -asmflags "all=-trimpath=$PWD" -ldflags "-s -w -extldflags $LDFLAGS"
}

package() {
  install -Dm755 $pkgname/$pkgname "$pkgdir/usr/bin/$pkgname"
  install -Dm644 $pkgname/LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim: ts=2 sw=2 et:
