# Maintainer: Alexander F. Rødseth <xyproto@archlinux.org>

pkgname=carveimg
pkgver=1.2.1
pkgrel=1
pkgdesc='Two image viewing utilities for the terminal, where one uses seam carving'
arch=(x86_64)
url='https://github.com/xyproto/carveimg'
license=(BSD)
makedepends=(git go)
source=("git+$url#commit=248fe686214588e85bb0bcc54e9f96628699cb14") # tag: v1.2.1
b2sums=('SKIP')

build() {
  (cd $pkgname/cmd/img && go build -v -mod=vendor -buildmode=pie -trimpath -ldflags="-s -w -extldflags \"${LDFLAGS}\"")
  (cd $pkgname/cmd/carve && go build -v -mod=vendor -buildmode=pie -trimpath -ldflags="-s -w -extldflags \"${LDFLAGS}\"")
}

package() {
  cd $pkgname
  install -Dm755 cmd/img/img "$pkgdir/usr/bin/img"
  install -Dm755 cmd/carve/carve "$pkgdir/usr/bin/carve"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
