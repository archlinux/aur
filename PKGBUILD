# Maintainer: Matt Harrison <matt@harrison.us.com>

pkgname=statping
pkgver=0.90.20
pkgrel=1
pkgdesc='An easy to use Status Page for your websites and applications.'
arch=(x86_64)
url='https://statping.com/'
license=("GPL3")
depends=(glibc)
makedepends=(go-pie go.rice yarn)
source=("$pkgname-$pkgver.tar.gz::https://github.com/$pkgname/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('a1878555f0b009c2257a3ec9345103ad9383b8a3f0aaed9d7685a4aa77e377ca')
_commit_version=11538c38e3cc6677410ec277659b4030a72a3242

build() {
  cd "$srcdir/$pkgname-$pkgver"
  make compile
  go build -a -ldflags "-X main.VERSION=${pkgver} -X main.COMMIT=$_commit_version" -o $pkgname -v ./cmd
}

package() {
  install -D -m 0755 "$srcdir/$pkgname-$pkgver/statping" "$pkgdir/usr/bin/statping"
  install -Dm644 "$srcdir/$pkgname-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
