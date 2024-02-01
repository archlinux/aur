# Maintainer: Carl Smedstad <carl.smedstad at protonmail dot com>

pkgname=httprobe
pkgver=0.2
pkgrel=1
pkgdesc="Take a list of domains and probe for working HTTP and HTTPS servers"
arch=(x86_64)
url="https://github.com/tomnomnom/httprobe"
license=(MIT)
depends=(glibc)
makedepends=(go)
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('33a460c675487e1bf75d0761d850a98a8777715731b4de930d056abbeb4e4d2f')

_archive="$pkgname-$pkgver"

build() {
  cd "$_archive"

  export CGO_CPPFLAGS="$CPPFLAGS"
  export CGO_CFLAGS="$CFLAGS"
  export CGO_CXXFLAGS="$CXXFLAGS"
  export CGO_LDFLAGS="$LDFLAGS"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"

  go build -v -buildvcs=false
}

package() {
  cd "$_archive"

  install -Dm755 -t "$pkgdir/usr/bin" httprobe

  install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname" README.md
  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
