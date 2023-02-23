# Maintainer: matt kasun <matt  at netmaker.io>
pkgname=nmctl
pkgver=0.18.1
pkgrel=0
pkgdesc="cli to control netmaker, a platform for modern, blazing fast wg virtual networks"
arch=(x86_64)
url='https://github.com/gravitl/netmaker'
license=('SSPL')
makedepends=(go)

source=("${pkgver}-${pkgrel}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('250909b138588fc40dfec88f9faac3ff202f1670dac65014e2e9a5a384224df7')

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
