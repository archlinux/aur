# Maintainer: erdii <me at erdii dot engineering>
pkgname=ocm-addons
pkgver=0.7.15
pkgrel=2
pkgdesc="A plug-in for the ocm-cli which provides commands for working with add-ons for managed OpenShift."
arch=("any")
provides=("ocm-addons")
conflicts=()
url="https://github.com/mt-sre/ocm-addons"
license=("Apache")
depends=()
makedepends=("go" "goreleaser")
source=("ocm-addons-${pkgver}::git+https://github.com/mt-sre/ocm-addons#tag=v${pkgver}")
sha256sums=('SKIP')

build() {
  cd "${srcdir}/ocm-addons-${pkgver}"
  # use goreleaser instead of `go build` to have proper version info in the binary
  goreleaser build --clean --single-target -o .
}

package() {
  install -Dm755 "${srcdir}/ocm-addons-${pkgver}/ocm-addons" "${pkgdir}/usr/bin/ocm-addons"
}
