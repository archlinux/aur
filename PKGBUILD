# Maintainer: matt kasun <matt  at netmaker.io>

pkgname=nmctl
_name=netmaker
pkgver=0.90.0
pkgrel=1
pkgdesc="cli to control netmaker, a platform for modern, blazing fast wg virtual networks"
arch=(x86_64)
url='https://github.com/gravitl/netmaker'
license=('Apache')
depends=(glibc)
makedepends=(go)
source=("${_name}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('fcc9cba1f1d5cc4a59a2401412fc55083d13eaeb958913b7c5a7acadfa958b44')


build() {
  cd "${_name}-${pkgver}/cli"
  CGO_ENABLED=0

  go build \
    -trimpath \
    -buildmode=pie \
    -mod=readonly \
    -modcacherw \
    -ldflags "-linkmode external -extldflags \"${LDFLAGS}\"" \
    -tags headless \
    -o nmctl \
    .
}

package() {
	install -Dm755 "${_name}-${pkgver}/cli/nmctl" "$pkgdir/usr/bin/nmctl"
}
