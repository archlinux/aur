# Maintainer: Benjamin Denhartog <ben@sudoforge.com>

pkgname=terragrunt
pkgver=0.23.25
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
sha256sums=('9f6e2fa677cb39319c3f474c58f3013ba0f49acf8a844b422ebeeea01f7e0b2f')

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
