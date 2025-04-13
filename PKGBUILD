# Maintainer: erdii <me at erdii dot engineering>
pkgname=osdctl
pkgver=0.43.0
pkgrel=0
pkgdesc="CLI for the OSD utilities"
arch=("any")
conflicts=()
url="https://github.com/openshift/osdctl"
license=("Apache")
depends=()
makedepends=("go" "goreleaser")
source=("osdctl-${pkgver}::git+https://github.com/openshift/osdctl#tag=v${pkgver}")
sha256sums=('b4c89540dd8c32a79f92c44a4981db3de8de449aa31fc51d8655bac369ac00a4')

build() {
  cd "${srcdir}/osdctl-${pkgver}"
  # use goreleaser instead of `make build` to have proper version info in the binary
  goreleaser build --clean --single-target -o .
}

package() {
  install -Dm755 "${srcdir}/osdctl-${pkgver}/osdctl" "${pkgdir}/usr/bin/osdctl"
}
