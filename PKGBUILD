# Maintainer: Alexander F. Rødseth <xyproto@archlinux.org>

pkgname=teaftp
pkgver=1.3.2
pkgrel=1
pkgdesc='Simple, read-only TFTP server'
arch=(x86_64)
url='https://github.com/xyproto/teaftp'
license=(BSD)
makedepends=(git go)
source=("git+$url#tag=v$pkgver")
b2sums=('b651ea10c490bbac0b61ea972afc423fd3885d31d1bb4ef3724740def601ded062955a622fe72b02993dfc356739ada363265ca1e185c0e65cd83ba5766c69f0')

build() {
  cd $pkgname
  go build -buildmode=pie -ldflags="-s -w -extldflags \"${LDFLAGS}\"" -mod=vendor -trimpath -v
}

package() {
  cd $pkgname
  install -Dm755 $pkgname "$pkgdir/usr/bin/$pkgname"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
