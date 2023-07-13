# Maintainer: Carl Smedstad <carl.smedstad at protonmail dot com>

pkgname=scrape-cli
_name=scrape
pkgver=1.8.0
pkgrel=2
pkgdesc="CLI utility to scrape emails from websites"
arch=(x86_64)
url="https://github.com/lawzava/scrape"
license=(MIT)
depends=(glibc)
makedepends=(go)

source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('fce2d37eb0a756a63044dfc3282e8fc5c11dec0502ee7fc8652d7b62a1fe200f')

_archive="$_name-$pkgver"

build() {
  cd "$_archive"

  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"

  go build .
}

package() {
  cd "$_archive"

  install -Dm755 scrape "$pkgdir/usr/bin/scrape"
  install -Dm644 LICENSE.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
