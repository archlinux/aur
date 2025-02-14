# Maintainer: orhun <orhunparmaksiz@gmail.com>
# https://github.com/orhun/pkgbuilds

pkgname=tz
pkgver=0.8.0
pkgrel=1
pkgdesc="A time zone helper"
arch=('x86_64')
url="https://github.com/oz/tz"
license=('GPL3')
depends=('glibc')
makedepends=('go')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha512sums=('b043c6e5df161db3d0cb6908de33c7367fda521a219fcee6b5181392304127597f3e8463e4b67fa5b045c7f36f50558babec4af3128e019ce8e76d46bd36915c')

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
