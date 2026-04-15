# Maintainer: erdii <me at erdii dot engineering>
pkgname=osdctl
pkgver=0.55.0
pkgrel=0
pkgdesc="CLI for the OSD utilities"
arch=("any")
conflicts=()
url="https://github.com/openshift/osdctl"
license=("Apache")
depends=()
makedepends=("go" "goreleaser")
source=("osdctl-${pkgver}::git+https://github.com/openshift/osdctl#tag=v${pkgver}")
sha256sums=('6f11dc6819b9ab68f76d5688923f8c4c9cbd2586f235eefe1f0cd9d522ad2195')

build() {
  cd "${srcdir}/osdctl-${pkgver}"
  # use goreleaser instead of `make build` to have proper version info in the binary
  goreleaser build --clean --single-target -o .
}

package() {
  install -Dm755 "${srcdir}/osdctl-${pkgver}/osdctl" "${pkgdir}/usr/bin/osdctl"
}
