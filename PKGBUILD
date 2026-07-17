# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=irtt
pkgver=0.9.2
pkgrel=1
pkgdesc="Isochronous round-trip tester"
arch=('i686' 'x86_64')
url="https://github.com/heistp/irtt"
license=('GPL-2.0-or-later')
depends=('glibc')
makedepends=('go')
source=("$pkgname-$pkgver.tar.gz::https://github.com/heistp/irtt/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('dd5eebf0e01e3764edf10fb6f4743b064239e7e89f4c27ca4177676b1f6ae60b')
validpgpkeys=('35C296FC733AA777B03DB9A8CAEC8F418885D165')  # Pete Heist <pete@eventide.io>


export CGO_CPPFLAGS="${CPPFLAGS}"
export CGO_CFLAGS="${CFLAGS}"
export CGO_CXXFLAGS="${CXXFLAGS}"
export CGO_LDFLAGS="${LDFLAGS}"
export GOFLAGS="-buildmode=pie -ldflags=-linkmode=external -trimpath -modcacherw"  # -mod=readonly

build() {
  cd "$pkgname-$pkgver"

  go build \
    ./cmd/...
}

check() {
  cd "$pkgname-$pkgver"

  go test \
    ./...
}

package() {
  cd "$pkgname-$pkgver"

  install -Dm755 "irtt" -t "$pkgdir/usr/bin"
  install -Dm644 "doc"/irtt.{html,md} -t "$pkgdir/usr/share/doc/irtt"
  install -Dm644 "doc/irtt.1" -t "$pkgdir/usr/share/man/man1"
  install -Dm644 "LICENSE" -t "$pkgdir/usr/share/licenses/irtt"
}
