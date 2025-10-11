# Maintainer: Achno <logiaTemp@proton.me>
pkgname=gowall
pkgver=0.2.3
pkgrel=1
pkgdesc="A tool to convert a Wallpaper's color scheme - palette"
arch=('x86_64')
url="https://github.com/Achno/gowall"
license=('MIT')
depends=('glibc')
makedepends=('go>=1.24')
source=("$pkgname-$pkgver.tar.gz::https://github.com/Achno/gowall/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('SKIP')


prepare() {
  cd "$srcdir/$pkgname-$pkgver"
  go mod tidy

}

build() {

  cd "$srcdir/$pkgname-$pkgver"
  # export GOPATH="$srcdir/go"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"

  go build -v -o gowall

}


package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -Dm755 gowall "$pkgdir/usr/bin/gowall"
}
