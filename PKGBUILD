# Maintainer: matt kasun <matt  at netmaker.io>
pkgname=nmctl
pkgver=0.18.7
pkgrel=0
pkgdesc="cli to control netmaker, a platform for modern, blazing fast wg virtual networks"
arch=(x86_64)
url='https://github.com/gravitl/netmaker'
license=('SSPL')
makedepends=(go)

source=("${pkgver}-${pkgrel}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('cfbc99e5bce7faac39ca8558360cff98dedb4f8c5e3a3b63c72385bcc04dba73')

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
