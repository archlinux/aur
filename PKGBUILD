# Maintainer: matt kasun <matt  at netmaker.io>
pkgname=nmctl
pkgver=0.21.1
pkgrel=1
pkgdesc="cli to control netmaker, a platform for modern, blazing fast wg virtual networks"
arch=(x86_64)
url='https://github.com/gravitl/netmaker'
license=('Apache')
makedepends=(go)

source=("${pkgver}-${pkgrel}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('661377ce65210897225a689e74dc40c32a108b4444080e9fe867dfda90c70613')

build() {
  cd "${srcdir}/netmaker-${pkgver}/cli"
  CGO_ENABLED=0

  go build \
    -gcflags "all=-trimpath=${PWD}" \
    -asmflags "all=-trimpath=${PWD}" \
    -ldflags "-s -w  -extldflags ${LDFLAGS}" \
    -tags headless \
    -o nmctl \
    .
}

package() {
	install -Dm755 "${srcdir}/netmaker-${pkgver}/cli/nmctl" "$pkgdir/usr/bin/nmctl"
}
