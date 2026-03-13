# Maintainer: erdii <me at erdii dot engineering>
pkgname=osdctl
pkgver=0.54.0
pkgrel=0
pkgdesc="CLI for the OSD utilities"
arch=("any")
conflicts=()
url="https://github.com/openshift/osdctl"
license=("Apache")
depends=()
makedepends=("go" "goreleaser")
source=("osdctl-${pkgver}::git+https://github.com/openshift/osdctl#tag=v${pkgver}")
sha256sums=('235ccb5ae99038d43d85d8c773c6d5643058e2475aa31d544231cf2ed51887b1')

build() {
  cd "${srcdir}/osdctl-${pkgver}"
  # use goreleaser instead of `make build` to have proper version info in the binary
  goreleaser build --clean --single-target -o .
}

package() {
  install -Dm755 "${srcdir}/osdctl-${pkgver}/osdctl" "${pkgdir}/usr/bin/osdctl"
}
