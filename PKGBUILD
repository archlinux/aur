# Maintainer: lmartinez-mirror
pkgname=frangipanni
pkgver=0.4.0
pkgrel=1
pkgdesc="Program to convert lines of text into a tree structure"
arch=('x86_64')
url="https://github.com/birchb1024/frangipanni"
license=('MIT')
depends=('glibc')
makedepends=('go')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('81fb239a7c93d5f6f9e83662675ab4227f62f57b215a04e1773383225d99d7b6')

build() {
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"

  cd "$pkgname-$pkgver"
  go build
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm 755 frangipanni -t "$pkgdir/usr/bin/"
  install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}

