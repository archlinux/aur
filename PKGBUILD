# Maintainer: Carl Smedstad <carl.smedstad at protonmail dot com>

pkgname=yajsv
pkgver=1.4.1
pkgrel=2
pkgdesc="Yet Another CLI JSON Schema Validator"
arch=(x86_64)
url="https://github.com/neilpa/yajsv"
license=(MIT)
makedepends=(go)
depends=(glibc)

source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('08118f3614231f3c5f86f4f68816e706e120b8c91cdf6c1caaea45a71e3e5943')

_archive="$pkgname-$pkgver"

build() {
  cd "$_archive"

  export CGO_CPPFLAGS="$CPPFLAGS"
  export CGO_CFLAGS="$CFLAGS"
  export CGO_CXXFLAGS="$CXXFLAGS"
  export CGO_LDFLAGS="$LDFLAGS"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"

  go build -v -o "$pkgname"
}

check() {
  cd "$_archive"

  go test ./...
}

package() {
  cd "$_archive"

  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm755 "$pkgname" "$pkgdir/usr/bin/$pkgname"
}
