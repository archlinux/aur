# Maintainer: swomf <swomf at proton dot me> -> https://github.com/swomf

pkgname=vmdfmt
pkgver=0.1.0
pkgrel=5
pkgdesc="Markdown autoformatter similar to gofmt"
arch=(any)
url="https://github.com/bobertlo/vmd"
license=(ISC)
depends=(go)
source=("https://github.com/bobertlo/vmd/archive/v${pkgver}.tar.gz")
sha256sums=('b60cafbe6d6a1e2cfca16f12b28ac27bbc8a2b1ec3a2a4a77a048ba1cddf9b9c')

build() {
  cd "$srcdir/vmd-$pkgver"
  export CGO_CPPFLAGS="$CPPFLAGS"
  export CGO_CFLAGS="$CFLAGS"
  export CGO_CXXFLAGS="$CXXFLAGS"
  export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"
  go build ./cmd/vmdfmt
}

package() {
  cd "$srcdir/vmd-$pkgver"
  install -Dm755 vmdfmt "$pkgdir/usr/bin/vmdfmt"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
