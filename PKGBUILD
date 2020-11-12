# Maintainer: orhun <orhunparmaksiz@gmail.com>
# https://github.com/orhun/pkgbuilds

pkgname=passwall-server
pkgdesc="Core backend infrastructure of the PassWall platform"
pkgver=1.1.5
pkgrel=1
arch=('x86_64')
url="https://github.com/passwall/passwall-server"
license=('AGPL3')
makedepends=('go')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('994bbf0944963e20771439246b93535cca3d00fe546ff2a8272f1dafa5621b07')

build() {
  cd "$pkgname-$pkgver/cmd/$pkgname"
  go get -d ./...
  go build \
    -gcflags "all=-trimpath=$PWD" \
    -asmflags "all=-trimpath=$PWD" \
    -ldflags "-extldflags $LDFLAGS" \
    -o "$pkgname" .
}

package() {
  cd "$pkgname-$pkgver/cmd/$pkgname"
  install -Dm 755 "$pkgname" "$pkgdir/usr/bin/$pkgname"
  install -Dm 644 "../../README.md" -t "$pkgdir/usr/share/doc/$pkgname"
}
