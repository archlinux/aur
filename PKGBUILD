# Maintainer: Giovanni Harting <539@idlegandalf.com>

pkgname=alhp-utils
_name=alhp.utils
pkgver=1.0.6
pkgrel=1
pkgdesc='Collection of ALHP utils'
arch=(x86_64)
url="https://somegit.dev/ALHP/$_name"
license=(GPL-2.0-or-later)
depends=(glibc pacman)
makedepends=(go)
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
b2sums=('ddc0a8ed247f88e77ea3b9c6fec551877979376e66df0d5545ed8f762e1af61686315320bc36544b6db217c2c46a88b49569e0f327d6d38eacc2cc085b4d3d50')

build() {
  cd $_name

  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
  go build -o $_name .
}

package() {
  install -Dm 755 $_name/$_name -t "$pkgdir"/usr/bin/
}

# vim:set ts=2 sw=2 et:
