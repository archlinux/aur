# Maintainer: erdii <me at erdii dot engineering>
pkgname=backplane-cli
pkgver=0.10.0
pkgrel=0
pkgdesc="backplane-cli is a CLI tool to interact with backplane-api."
arch=("any")
provides=("ocm-backplane")
conflicts=()
url="https://github.com/openshift/backplane-cli"
license=("Apache")
# idk what libraries that thing depends on when using CGO 🤷
depends=()
makedepends=("go" "goreleaser" "mockgen")
source=("backplane-cli-${pkgver}::git+https://github.com/openshift/backplane-cli#tag=v${pkgver}")
sha256sums=('726c7854d92ff5209c10b825aeb310816174418aeca648e4f73f76f3e01aa54d')

build() {
  cd "${srcdir}/backplane-cli-${pkgver}"
  # use goreleaser instead of `make build` to have proper version info in the binary
  goreleaser build --clean --single-target -o .
}

package() {
  install -Dm755 "${srcdir}/backplane-cli-${pkgver}/ocm-backplane" "${pkgdir}/usr/bin/ocm-backplane"
}
