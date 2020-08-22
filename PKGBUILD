# Maintainer: orhun <orhunparmaksiz@gmail.com>
# https://github.com/orhun/pkgbuilds

pkgname=passwall-server
pkgdesc="Core backend infrastructure of the PassWall platform"
pkgver=1.1.2
pkgrel=1
arch=('x86_64')
url="https://github.com/passwall/passwall-server"
license=('AGPL3')
depends=('git')
makedepends=('go')
source=("git+$url")
sha256sums=('SKIP')

build() {
  cd "$srcdir/$pkgname/cmd/$pkgname"
  go get -d ./...
  go build \
    -gcflags "all=-trimpath=$PWD" \
    -asmflags "all=-trimpath=$PWD" \
    -ldflags "-extldflags $LDFLAGS" \
    -o "$pkgname" .
}

package() {
  cd "$srcdir/$pkgname/cmd/$pkgname"
  install -Dm 755 "$pkgname" "$pkgdir/usr/local/bin/$pkgname"
}
