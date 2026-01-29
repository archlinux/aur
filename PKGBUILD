# Maintainer: erdii <me at erdii dot engineering>
pkgname=osdctl
pkgver=0.51.0
pkgrel=0
pkgdesc="CLI for the OSD utilities"
arch=("any")
conflicts=()
url="https://github.com/openshift/osdctl"
license=("Apache")
depends=()
makedepends=("go" "goreleaser")
source=("osdctl-${pkgver}::git+https://github.com/openshift/osdctl#tag=v${pkgver}")
sha256sums=('8429ea8c8486dc770b593298d8f114f85d92029925fd84722cd829f3b216ce79')

build() {
  cd "${srcdir}/osdctl-${pkgver}"
  # use goreleaser instead of `make build` to have proper version info in the binary
  goreleaser build --clean --single-target -o .
}

package() {
  install -Dm755 "${srcdir}/osdctl-${pkgver}/osdctl" "${pkgdir}/usr/bin/osdctl"
}
