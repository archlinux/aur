# Maintainer: orhun <orhunparmaksiz@gmail.com>
# https://github.com/orhun/pkgbuilds

pkgname=ctree
pkgver=1.0.1
pkgrel=1
pkgdesc="A Christmas tree right from your terminal"
arch=('x86_64')
url="https://github.com/gleich/ctree"
license=('MIT')
depends=('glibc')
makedepends=('go')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha512sums=('fc1fb777f15eb684be9d8c11868b56849cb4e3ac3ec8de52a713ab2028bb588d621c940f54d2f575bcda90480dad11f23186fe4fbf975e7dd8d62da5908f52b9')

build() {
  cd "$pkgname-$pkgver"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
  go build -o "$pkgname" .
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm 755 "$pkgname" -t "$pkgdir/usr/bin"
  install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
  install -Dm 644 LICENSE.md -t "$pkgdir/usr/share/licenses/$pkgname"
}
