# Maintainer: matt kasun <matt  at netmaker.io>
pkgname=nmctl
pkgver=0.21.0
pkgrel=1
pkgdesc="cli to control netmaker, a platform for modern, blazing fast wg virtual networks"
arch=(x86_64)
url='https://github.com/gravitl/netmaker'
license=('SSPL')
makedepends=(go)

source=("${pkgver}-${pkgrel}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('4611544a5681f227aec005a6a3797c2295fdad3145bf64ec02795bf0a05f20d6')

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
