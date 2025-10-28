# Maintainer: erdii <me at erdii dot engineering>
pkgname=backplane-cli
pkgver=0.5.0
pkgrel=0
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
sha256sums=('dd6115dbf5eda542c4f581f10ab7d4b6d5a714e9ba7768f7b3efb94b15d94d3c')

build() {
  cd "${srcdir}/backplane-cli-${pkgver}"
  # use goreleaser instead of `make build` to have proper version info in the binary
  goreleaser build --clean --single-target -o .
}

package() {
  install -Dm755 "${srcdir}/backplane-cli-${pkgver}/ocm-backplane" "${pkgdir}/usr/bin/ocm-backplane"
}
