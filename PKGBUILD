# Maintainer: Alexander F. Rødseth <xyproto@archlinux.org>

pkgname=o
pkgver=2.26.3
pkgrel=1
pkgdesc='Small, fast and VT100-compatible text editor'
arch=(x86_64)
url='https://github.com/xyproto/o'
license=(BSD)
makedepends=(git go-pie)
source=("git+$url#commit=44ce8835d07d595bcf8637ad2eb020b1d4abbb6c") # tag: 2.26.3
sha256sums=('SKIP')
options=(!strip)

build() {
  cd "$pkgname"

  # Using gccgo + upx gives a smaller size
  #go build -buildmode=pie -gccgoflags="-s -w $LDFLAGS" && upx o

  go build -buildmode=pie -gcflags="all=-trimpath=$PWD" -asmflags "all=-trimpath=$PWD" -ldflags "-s -w -extldflags $LDFLAGS"
}

package() {
  install -Dm755 $pkgname/o "$pkgdir/usr/bin/o"
  install -Dm644 $pkgname/o.1 "$pkgdir/usr/share/man/man1/o.1"
  install -Dm644 $pkgname/LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim: ts=2 sw=2 et:
