# Maintainer: Alexander F. Rødseth <xyproto@archlinux.org>

pkgname=easy
pkgver=1.3.0
pkgrel=1
pkgdesc='nice and ionice as a single utility'
arch=(x86_64)
url='https://github.com/xyproto/easy'
license=(GPL2)
makedepends=(git go)
source=("git+$url#commit=4262c9f46b7f3f48751df30acda3438bbc2b7c91") # tag: v1.3.0
sha256sums=('SKIP')

build() {
  cd $pkgname
  go build -v -mod=vendor -trimpath -buildmode=pie -ldflags="-s -w -extldflags \"${LDFLAGS}\""
}

package() {
  install -Dm755 $pkgname/$pkgname "$pkgdir/usr/bin/$pkgname"
  install -Dm644 $pkgname/$pkgname.1 "$pkgdir/usr/share/man/man1/$pkgname.1"
}
