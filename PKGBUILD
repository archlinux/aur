# Maintainer: Matt Harrison <matt@harrison.us.com>

pkgname=statping
pkgver=0.90.44
pkgrel=1
pkgdesc='An easy to use Status Page for your websites and applications.'
arch=(x86_64)
url='https://statping.com/'
license=("GPL3")
depends=(glibc)
makedepends=(go-pie go.rice yarn python2)
source=("$pkgname-$pkgver.tar.gz::https://github.com/$pkgname/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('e3b7c7cdfc6ee63d5cc138f369a018dc12fc8f2ff38639d6c0c7bec4f83381c2')
_commit_version=676ae77fad9d618ec1918f217a70e27b67b236e4

build() {
  # Just update for now because Arch version of node is too new.
  cd "$srcdir/$pkgname-$pkgver/frontend"
  yarn upgrade

  cd "$srcdir/$pkgname-$pkgver"
  make compile
  go build -a -ldflags "-X main.VERSION=${pkgver} -X main.COMMIT=$_commit_version" -o $pkgname -v ./cmd
}

package() {
  install -D -m 0755 "$srcdir/$pkgname-$pkgver/statping" "$pkgdir/usr/bin/statping"
  install -Dm644 "$srcdir/$pkgname-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
