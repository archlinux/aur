# Maintainer: Giovanni Harting <539@idlegandalf.com>

pkgname=alhp-utils
_name=alhp.utils
pkgver=1.0.5
pkgrel=1
pkgdesc='Collection of ALHP utils'
arch=(x86_64)
url="https://somegit.dev/ALHP/$_name"
license=(GPL-2.0-or-later)
depends=(glibc pacman)
makedepends=(go)
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
b2sums=('019e7ac08f06a38ca30bb1dee371c1bf7f9a1899638abf4bce442f38d77c2e26fd44477d805bbeb885fdb51d25e61bceba76933ca700fbccd6fecbcaf91a5ea6')

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
