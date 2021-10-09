# Maintainer : atriix <aur a snilius d com>

pkgname=godoc
pkgver=0.1.7
pkgrel=1
pkgdesc='Godoc extracts and generates documentation for Go programs'
arch=('x86_64')
url="https://golang.org/x/tools/cmd/godoc"
license=('GPL')
makedepends=('go')
conflicts=(godoc)
source=("https://github.com/golang/tools/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('b88cae9ca14fc3f18ff714c8014929c8c2c63d15805416d49d88b51f201e9fbf')


build() {
  cd "tools-$pkgver"

  go mod vendor
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw -v"
  go build -o _godoc -v golang.org/x/tools/cmd/godoc
}

package() {
  cd "tools-$pkgver"
  install -Dm755 _godoc "$pkgdir"/usr/bin/$pkgname
}

# vim: ts=2 sw=2 et ft=PKGBUILD:
