# Maintainer: Matt Harrison <matt@harrison.us.com>

pkgname=statping
pkgver=0.90.71
pkgrel=1
pkgdesc='An easy to use Status Page for your websites and applications.'
arch=(x86_64)
url='https://statping.com/'
license=("GPL3")
depends=(glibc)
makedepends=(go go.rice yarn python2)
source=("$pkgname-$pkgver.tar.gz::https://github.com/$pkgname/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('9b07c5567a4253e0946f89f5ad97211bf8bb193b3f8906eefc056687f1839f78')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  make compile
  go build -a -ldflags "-s -w -extldflags -static -X main.VERSION=${pkgver}" -o $pkgname --tags "netgo linux" ./cmd
}

package() {
  install -D -m 0755 "$srcdir/$pkgname-$pkgver/statping" "$pkgdir/usr/bin/statping"
  install -Dm644 "$srcdir/$pkgname-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
