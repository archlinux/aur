# Maintainer: erdii <me at erdii dot engineering>
pkgname=osdctl
pkgver=0.39.0
pkgrel=1
pkgdesc="CLI for the OSD utilities"
arch=("any")
conflicts=()
url="https://github.com/openshift/osdctl"
license=("Apache")
depends=()
makedepends=("go" "goreleaser")
source=("osdctl-${pkgver}::git+https://github.com/openshift/osdctl#tag=v${pkgver}")
sha256sums=('33ae7ead48a48c21a0c4830f9fe1f47b0f6c8b82068f229b9eb76795f28ff161')

build() {
  cd "${srcdir}/osdctl-${pkgver}"
  # use goreleaser instead of `make build` to have proper version info in the binary
  goreleaser build --clean --single-target -o .
}

package() {
  install -Dm755 "${srcdir}/osdctl-${pkgver}/osdctl" "${pkgdir}/usr/bin/osdctl"
}
