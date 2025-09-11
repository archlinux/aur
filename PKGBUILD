# Maintainer: Brian Thompson <brianrobt at pm.me>
# Contributor: matt kasun <matt  at netmaker.io>

pkgname=nmctl
_name=netmaker
pkgver=1.1.0
pkgrel=1
pkgdesc="cli to control netmaker, a platform for modern, blazing fast wg virtual networks"
arch=(x86_64)
url='https://github.com/gravitl/netmaker'
license=('Apache')
depends=(glibc)
makedepends=(go)
source=("${_name}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('30114ff17559118f9f5b28dfe5c441b2da03c3f129d6f38539525df44539635a')


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