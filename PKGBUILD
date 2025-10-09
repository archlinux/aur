# Maintainer: Amolith <amolith@secluded.site>

pkgname=go-prism
pkgver=1.3.0
pkgrel=1
pkgdesc='Turn raw test output into beautiful data'
arch=('x86_64' 'aarch64')
url='https://github.com/DaltonSW/prism'
license=('MIT')
install=.install
makedepends=('go')
conflicts=('go-prism-bin' 'go-prism-git')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
b2sums=('2014446eaddb4d0b8962d503bf4b159dc923a9c7bac2b892b5d2f2282e52e6b8c037d5d69a5e910731bfd58ffb46b193a6ffbdca0a22a52bc6e486c19647815e')

prepare() {
  cd "prism-$pkgver"
  export GOPATH="$srcdir"
  go mod download -modcacherw
}

build() {
  cd "prism-$pkgver"
  export CGO_CPPFLAGS="$CPPFLAGS"
  export CGO_CFLAGS="$CFLAGS"
  export CGO_CXXFLAGS="$CXXFLAGS"
  export CGO_LDFLAGS="$LDFLAGS"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
  go build
}

package() {
  cd "prism-$pkgver"
  install -Dm755 "prism" "$pkgdir/usr/bin/go-prism"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
