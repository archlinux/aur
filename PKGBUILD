# Maintainer: Giovanni Harting <539@idlegandalf.com>

pkgname=alhp-utils
_name=alhp.utils
pkgver=1.0.2
pkgrel=1
pkgdesc='Collection of ALHP utils'
arch=(x86_64)
url="https://somegit.dev/ALHP/$_name"
license=(GPL-2.0-or-later)
depends=(glibc pacman)
makedepends=(go)
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
b2sums=('6736f62501dc1f6f9042546a5f1f964dfd542412d97418524af440ae6eec692d2460aea6daf59a7018825e70341f938f02c84883450bcef0ee67924199c01de6')

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
