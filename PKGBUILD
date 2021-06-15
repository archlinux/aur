# Maintainer: Matt Harrison <matt@harrison.us.com>

pkgname=go.rice
pkgver=1.0.2
pkgrel=1
pkgdesc='Go package that makes working with resources such as html,js,css,images,templates, etc very easy.'
arch=(x86_64)
url='https://github.com/GeertJohan/go.rice'
license=("BSD")
depends=(glibc)
makedepends=(go)
source=("$pkgname-$pkgver.tar.gz::https://github.com/GeertJohan/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('2eed960aa9531a87c82d2379677723bc0129bc9e387dc0dbb3bb70b78c928dd0')

build() {
  cd "$srcdir/$pkgname-$pkgver/rice"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
  go build -a
}

package() {
  install -D -m 0755 "$srcdir/$pkgname-$pkgver/rice/rice" "$pkgdir/usr/bin/rice"
  install -Dm644 "$srcdir/$pkgname-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
