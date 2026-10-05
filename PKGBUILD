# Maintainer: erdii <me at erdii dot engineering>
pkgname=backplane-cli
pkgver=1.0.0
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
sha256sums=('3c7e7e70d2fe37cc406c73d6b05b4892f8bb0d9e881d35d04b35ed59aebffcea')

build() {
  cd "${srcdir}/backplane-cli-${pkgver}"
  # use goreleaser instead of `make build` to have proper version info in the binary
  goreleaser build --clean --single-target -o .
}

package() {
  install -Dm755 "${srcdir}/backplane-cli-${pkgver}/ocm-backplane" "${pkgdir}/usr/bin/ocm-backplane"
}
