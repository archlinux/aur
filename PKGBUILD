# Maintainer: Alexander F. Rødseth <xyproto@archlinux.org>

pkgname=easy
pkgver=1.5.0
pkgrel=1
pkgdesc='nice and ionice as a single utility'
arch=(x86_64)
url='https://github.com/xyproto/easy'
license=(GPL2)
makedepends=(git go)
source=("git+$url#commit=85efd0f8dd8b3126e70448b44e4504ebe06d31ed") # tag: v1.5.0
b2sums=(SKIP)

build() {
  cd $pkgname
  go build -v -mod=vendor -trimpath -buildmode=pie -ldflags="-s -w -extldflags \"${LDFLAGS}\""
}

package() {
  install -Dm755 $pkgname/$pkgname "$pkgdir/usr/bin/$pkgname"
  install -Dm644 $pkgname/$pkgname.1 "$pkgdir/usr/share/man/man1/$pkgname.1"
}
