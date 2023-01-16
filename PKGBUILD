# Maintainer: orhun <orhunparmaksiz@gmail.com>
# https://github.com/orhun/pkgbuilds

pkgname=tz
pkgver=0.6.3
pkgrel=1
pkgdesc="A time zone helper"
arch=('x86_64')
url="https://github.com/oz/tz"
license=('GPL3')
depends=('glibc')
makedepends=('go')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha512sums=('091ac36c2fe942647b26b1850b550e48f8399fbe4fc81a4679b86095b554072564810c553c84dbae2c9ffd6760dec25fcffab77677144c3cdd434ec2fa238d5e')

build() {
  cd "$pkgname-$pkgver"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
  go build -o "$pkgname" *.go
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm 755 "$pkgname" -t "$pkgdir/usr/bin"
  install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
}
