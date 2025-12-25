# Maintainer: Giovanni Harting <539@idlegandalf.com>

pkgname=mmdbinspect
pkgver=2.0.0
pkgrel=1
pkgdesc='look up records for one or more IPs/networks in one or more .mmdb databases'
arch=(x86_64 aarch64 armv7h)
url="https://github.com/maxmind/mmdbinspect"
license=(Apache-2.0)
depends=(glibc)
makedepends=(go)
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
b2sums=('b33744bdc991553f52563521e6804447b107178e1f0d21cb73827b4b52ca31a14029aae080779bdd5eb6d3014e97d984bc8e2068642e7e55721384a8193ed458')

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
    ./...
}

package() {
  cd $pkgname-$pkgver
  install -Dm755 -t "$pkgdir"/usr/bin $pkgname
}

# vim:set ts=2 sw=2 et:
