# Maintainer: matt kasun <matt  at netmaker.io>
pkgname=nmctl
pkgver=0.20.5
pkgrel=1
pkgdesc="cli to control netmaker, a platform for modern, blazing fast wg virtual networks"
arch=(x86_64)
url='https://github.com/gravitl/netmaker'
license=('SSPL')
makedepends=(go)

source=("${pkgver}-${pkgrel}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('115ee23a76e5803a9e3eeac2d0956d050565868fb789942e456eb1b7a8691a91')

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
