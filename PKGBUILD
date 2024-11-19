# Maintainer: Sam Whited <sam@samwhited.com>

pkgname=dbus-codegen-go
pkgver=0.2.0
pkgrel=1
pkgdesc="Code generator for D-Bus introspection data format for Go."
arch=('x86_64')
url="https://github.com/amenzhinsky/dbus-codegen-go"
license=('MIT')
makedepends=('go')
source=("$pkgname-$pkgver.tar.gz::https://github.com/amenzhinsky/$pkgname/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('02e25e3fd0ad864685b9a301ab268c1fe3be54bb4394184159bd508a68fb6143')

prepare() {
  cd "$pkgname-$pkgver"
  go mod download
}

build() {
  cd "$pkgname-$pkgver"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
  go build .
}

package() {
  cd "$pkgname-$pkgver"

  install -d "$pkgdir/usr/bin"
  install -d "$pkgdir/usr/share/licenses/$pkgname"

  install -D $pkgname "$pkgdir/usr/bin"
  install -D LICENSE "$pkgdir/usr/share/licenses/$pkgname/"
}

# vim:set ts=2 sw=2 et:
