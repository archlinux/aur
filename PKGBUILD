# Maintainer: erdii <me at erdii dot engineering>
pkgname=backplane-cli
pkgver=0.1.25
pkgrel=1
pkgdesc="backplane-cli is a CLI tool to interact with backplane-api."
arch=("any")
provides=("ocm-backplane")
conflicts=()
url="https://github.com/openshift/backplane-cli"
license=("Apache")
# idk what libraries that thing depends on when using CGO 🤷
depends=()
makedepends=("go" "goreleaser")
source=("backplane-cli-${pkgver}::git+https://github.com/openshift/backplane-cli#tag=v${pkgver}")
sha256sums=('SKIP')

build() {
  cd "${srcdir}/backplane-cli-${pkgver}"
  # use goreleaser instead of `make build` to have proper version info in the binary
  goreleaser build --clean --single-target -o .
}

package() {
  install -Dm755 "${srcdir}/backplane-cli-${pkgver}/ocm-backplane" "${pkgdir}/usr/bin/ocm-backplane"
}
