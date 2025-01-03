# Maintainer: Adam Perkowski <adas1per@protonmail.com>
# https://github.com/adamperkowski/PKGBUILDs

pkgname=eddy
pkgver=1.4.2
pkgrel=1
pkgdesc='Simple & fast CLI file encryption tool'
arch=('x86_64')
url="https://github.com/70sh1/$pkgname"
license=('MIT')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('f073c927e1ca4157bfda6b10c7ab451214614923837e648abd22c5de0df632ba')
makedepends=('go')

prepare() {
  cd "$pkgname-$pkgver"

  mkdir -p build
}

build() {
  cd "$pkgname-$pkgver"

  export CGO_CPPFLAGS="$CPPFLAGS"
  export CGO_CFLAGS="$CFLAGS"
  export CGO_CXXFLAGS="$CXXFLAGS"
  export CGO_LDFLAGS="$LDFLAGS"
  export GOPATH="$srcdir"
  export GOFLAGS='-trimpath -buildmode=pie -mod=readonly -modcacherw'

  go build -o build/$pkgname .
}

package() {
  cd "$pkgname-$pkgver"

  install -Dm755 "build/$pkgname" -t "$pkgdir/usr/bin"

  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
  install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
  install -Dm644 SPEC.md -t "$pkgdir/usr/share/doc/$pkgname"
}

# vim: ts=2 sw=2 et:
