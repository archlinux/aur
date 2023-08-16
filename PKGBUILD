# Maintainer: Alexander F. Rødseth <xyproto@archlinux.org>

pkgname=aget
pkgver=1.3.3
pkgrel=2
pkgdesc='Minimalistic AUR helper'
arch=(x86_64)
url='https://github.com/xyproto/aget'
license=(BSD)
depends=(git)
makedepends=(go)
source=("git+$url#commit=b98582af99200e1de6db010a9aa49e0cd6d9f027") # tag: 1.3.3
b2sums=(SKIP)

build() {
  cd $pkgname
  go build -v -mod=vendor -trimpath -buildmode=pie -ldflags "-s -w -linkmode=external -extldflags=$LDFLAGS"
}

package() {
  cd $pkgname
  install -Dm755 $pkgname "$pkgdir/usr/bin/$pkgname"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
