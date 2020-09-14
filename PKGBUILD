# Maintainer: orhun <orhunparmaksiz@gmail.com>
# https://github.com/orhun/pkgbuilds

pkgname=passwall-server
pkgdesc="Core backend infrastructure of the PassWall platform"
pkgver=1.1.2
pkgrel=1
arch=('x86_64')
url="https://github.com/passwall/passwall-server"
license=('AGPL3')
makedepends=('go')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('d14931c309690a5d7668c1988bd406683ee12b4b1212887bcb8353ebc389ef46')

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
  install -Dm 755 "$pkgname" "$pkgdir/usr/local/bin/$pkgname"
  install -Dm 644 "../../README.md" -t "$pkgdir/usr/share/doc/$pkgname"
}
