# Maintainer: Benjamin Denhartog <ben@sudoforge.com>

pkgname=terragrunt
pkgver=0.23.14
pkgrel=1
pkgdesc="A thin wrapper for Terraform that provides extra tools for working with multiple Terraform modules"
url="https://github.com/gruntwork-io/terragrunt"
arch=('x86_64')
makedepends=(
  'git'
  'go-pie'
)
depends=('terraform')
conflicts=('terragrunt')
provides=('terragrunt')
license=('MIT')
source=("terragrunt-${pkgver}.tar.gz::https://github.com/gruntwork-io/terragrunt/archive/v${pkgver}.tar.gz")
sha256sums=('b9a5904b4392c32e5c70d9e28e455f7c2720b2c65c3b10748f14d7edd7c6fc85')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  go build \
    -ldflags "-X github.com/gruntwork-io/terragrunt.VERSION=${pkgver}" \
    -o "${pkgname}-${pkgver}" \
    main.go
}

package() {
  # Install the license file
  install -D -m 0644 \
    "${srcdir}/${pkgname}-${pkgver}/LICENSE.txt" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  # Install the executable
  install -D -m 0755 \
    "${srcdir}/${pkgname}-${pkgver}/${pkgname}-${pkgver}" \
    "${pkgdir}/usr/bin/${pkgname}"
}

# vim:set ts=2 sw=2 et:
