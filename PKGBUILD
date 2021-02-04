# Maintainer: Alexander F. Rødseth <xyproto@archlinux.org>

pkgname=chill
pkgver=1.0.0
pkgrel=1
pkgdesc='Standalone port of ionice to Go'
arch=(x86_64)
url='https://github.com/xyproto/chill'
license=(GPL2)
makedepends=(git go)
source=("git+$url#commit=9b89660af84fa340a49c54db0f79fae96f209874") # tag: v1.0.0
sha256sums=('SKIP')

build() {
  cd $pkgname
  go build -v -mod=vendor -trimpath -buildmode=pie -ldflags="-s -w -extldflags \"${LDFLAGS}\""
}

package() {
  install -Dm755 $pkgname/$pkgname "$pkgdir/usr/bin/$pkgname"
  install -Dm644 $pkgname/$pkgname.1 "$pkgdir/usr/share/man/man1/$pkgname.1"
}
