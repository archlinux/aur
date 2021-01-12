# Maintainer: Matt Harrison <matt@harrison.us.com>

pkgname=statping
pkgver=0.90.74
pkgrel=1
pkgdesc='An easy to use Status Page for your websites and applications.'
arch=(x86_64)
url='https://statping.com/'
license=("GPL3")
depends=(glibc)
makedepends=(go go.rice yarn python2)
source=("$pkgname-$pkgver.tar.gz::https://github.com/$pkgname/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('a00eed55bdeb84aecf2db6fbfa3897984d88dbe2fde495ccda5c7ee27ce5728f')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  make compile
  go build -a -ldflags "-s -w -extldflags -static -X main.VERSION=${pkgver}" -o $pkgname --tags "netgo linux" ./cmd
}

package() {
  install -D -m 0755 "$srcdir/$pkgname-$pkgver/statping" "$pkgdir/usr/bin/statping"
  install -Dm644 "$srcdir/$pkgname-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
