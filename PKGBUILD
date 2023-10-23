# Maintainer: Marcel Campello <marcel@prafrentex.com.br>
pkgname=opentofu
pkgver=1.6.0_alpha3
pkgrel=1
pkgdesc="The open source infrastructure as code tool."
arch=('any')
url="https://opentofu.org"
license=('MPL2')
makedepends=(
  'go>=1.20.7'
)
source=("${pkgname}.tar.gz::https://github.com/opentofu/opentofu/archive/refs/tags/v1.6.0-alpha3.tar.gz")
sha256sums=('726674ecede236fac2af0307c3afe74f1d2c5ae644f2195ca4e2ab2045364a77')

build() {
  export GOPATH="${srcdir}/go"
  export CGO_ENABLED=0

  cd "${srcdir}/${pkgname}-${pkgver//_/-}/cmd/tofu"
  pwd
  go install
}

package() {
  cd "${srcdir}/go"
  install bin/tofu -t "${pkgdir}/usr/bin" -Dm 0755
}
