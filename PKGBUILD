# Maintainer: Alexander F. Rødseth <xyproto@archlinux.org>

pkgname=teaftp
pkgver=1.3.0
pkgrel=1
pkgdesc='Simple, read-only TFTP server'
arch=(x86_64)
url='https://github.com/xyproto/teaftp'
license=(BSD)
makedepends=(git go)
source=("git+$url#commit=27e21c589f95d823c60d0079d02246a3bfcb314f") # tag: v1.3.0
b2sums=(SKIP)

build() {
  cd $pkgname
  go build -buildmode=pie -ldflags="-s -w -extldflags \"${LDFLAGS}\"" -mod=vendor -trimpath -v
}

package() {
  cd $pkgname
  install -Dm755 $pkgname "$pkgdir/usr/bin/$pkgname"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
