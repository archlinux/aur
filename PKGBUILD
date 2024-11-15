# Maintainer: Marek Küthe <m.k@mk16.de>

pkgname=minitrust
pkgver=0.1.4
pkgrel=1
pkgdesc="Tool that verifies minisign signatures using public keys from a trusted list"
arch=('x86_64')
url="https://github.com/igoose1/minitrust/"
license=('Apache-2.0')
makedepends=('go')
source=("$pkgname-$pkgver.tar.gz::https://github.com/igoose1/minitrust/archive/refs/tags/v$pkgver.tar.gz")
noextract=()
sha512sums=(e0891c65612ec69f89037d58553b3c005ba6fed1c7acfe567831a1ca7c6e295b22aaa152ffe9cf8e1db5a1f15fe2268df212425de65252e6778a16d19875533b)

build() {
  cd "$pkgname-$pkgver"

  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
  go build
}

package() {
  cd "$pkgname-$pkgver"

  install -Dm755 minitrust "$pkgdir/usr/bin/minitrust"
}

