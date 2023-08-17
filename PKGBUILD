# Maintainer: Matt Harrison <matt@harrison.us.com>

pkgname=go.rice
pkgver=1.0.3
pkgrel=1
pkgdesc='Go package that makes working with resources such as html,js,css,images,templates, etc very easy.'
arch=(x86_64)
url='https://github.com/GeertJohan/go.rice'
license=("BSD")
depends=(glibc)
makedepends=(go)
options=(!lto)
source=("$pkgname-$pkgver.tar.gz::https://github.com/GeertJohan/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('dda8be9c9c594e164e664479001e7113d0f6571b3fc93253ef132096540f0673')

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
