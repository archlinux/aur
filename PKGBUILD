# Maintainer: Giovanni Harting <539@idlegandalf.com>

pkgname=alhp-utils
_name=alhp.utils
pkgver=1.0.4
pkgrel=1
pkgdesc='Collection of ALHP utils'
arch=(x86_64)
url="https://somegit.dev/ALHP/$_name"
license=(GPL-2.0-or-later)
depends=(glibc pacman)
makedepends=(go)
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
b2sums=('9969e00f6e3da6f7ae4ecd9a6278b6103d7ad5b11d000e98392efaa5d9b474829fa6c789b6cef996e229d53fd4c877c6b41c9bda90e529a0324cc812260e1cf2')

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
