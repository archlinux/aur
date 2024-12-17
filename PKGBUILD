# Maintainer: erdii <me at erdii dot engineering>
pkgname=backplane-cli
pkgver=0.1.38
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
sha256sums=('774e7b5cef208bfbaa1a2e9e580ebba8b7a7ae0e869210104b4facdd5e98c011')

build() {
  cd "${srcdir}/backplane-cli-${pkgver}"
  # use goreleaser instead of `make build` to have proper version info in the binary
  goreleaser build --clean --single-target -o .
}

package() {
  install -Dm755 "${srcdir}/backplane-cli-${pkgver}/ocm-backplane" "${pkgdir}/usr/bin/ocm-backplane"
}
