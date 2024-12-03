# Maintainer: Giovanni Harting <539@idlegandalf.com>

pkgname=mmdbinspect
pkgver=0.2.0
pkgrel=1
pkgdesc='look up records for one or more IPs/networks in one or more .mmdb databases'
arch=(x86_64 aarch64 armv7h)
url="https://github.com/maxmind/mmdbinspect"
license=(Apache-2.0)
depends=(glibc)
makedepends=(go)
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
b2sums=('b293a03aa0d2b4407d06925ac5d6dcca22aa7170ce98cf757c5ddd7dadced42a2d9c662dbb32154a4f112d1ed1a43386a4c8512f0eb078936969dd412fa783d6')

build() {
  cd $pkgname-$pkgver

  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"

  go build \
  -trimpath \
  -buildmode=pie \
  -mod=readonly \
  -modcacherw \
  -ldflags "-linkmode external -extldflags \"${LDFLAGS}\"" \
  -o $pkgname \
  cmd/mmdbinspect/main.go
}

package() {
  cd $pkgname-$pkgver
  install -Dm755 -t "$pkgdir"/usr/bin $pkgname
}

# vim:set ts=2 sw=2 et:
