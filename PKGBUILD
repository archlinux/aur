# Maintainer: Amolith <amolith@secluded.site>

pkgname=go-prism
pkgver=1.2.0
pkgrel=1
pkgdesc='Turn raw test output into beautiful data'
arch=('x86_64' 'aarch64')
url='https://github.com/DaltonSW/prism'
license=('MIT')
install=.install
makedepends=('go')
conflicts=('go-prism-bin' 'go-prism-git')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
b2sums=('60c29045369a0ef91bb6a343b637b5b08f04e845d50b66e63755771e9065047c8cba251c28c928f5c789a3bc5669657f248872dd42d0c629db9e7458ae26430e')

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
