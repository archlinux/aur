# Maintainer: Giovanni Harting <539@idlegandalf.com>

pkgname=alhp-utils
_name=alhp.utils
pkgver=1.0.7
pkgrel=2
pkgdesc='Collection of ALHP utils'
arch=(x86_64)
url="https://somegit.dev/ALHP/$_name"
license=(GPL-2.0-or-later)
depends=(glibc pacman)
makedepends=(go git)
source=("git+$url.git#tag=$pkgver")
b2sums=('ba2ae7ec96cf656a6a7e4fb0f22c6ce8ffd78074b9bc264ae532bcb36bee0c1acb86764b03ee88aedf81884209beac2acbc90570fb4acc2cb7065cb765d1a798')

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
