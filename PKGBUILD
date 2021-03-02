# Maintainer: Alexander F. Rødseth <xyproto@archlinux.org>

pkgname=chill
pkgver=1.2.0
pkgrel=1
pkgdesc='nice and ionice as a single utility'
arch=(x86_64)
url='https://github.com/xyproto/chill'
license=(GPL2)
makedepends=(git go)
source=("git+$url#commit=8917528605ab571c8a7c2f49b51cb2dc54590e90") # tag: v1.2.0
sha256sums=('SKIP')

build() {
  cd $pkgname
  go build -v -mod=vendor -trimpath -buildmode=pie -ldflags="-s -w -extldflags \"${LDFLAGS}\""
}

package() {
  install -Dm755 $pkgname/$pkgname "$pkgdir/usr/bin/$pkgname"
  install -Dm644 $pkgname/$pkgname.1 "$pkgdir/usr/share/man/man1/$pkgname.1"
}
