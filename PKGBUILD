# Maintainer: Claudia Pellegrino <aur@cpellegrino.de>

pkgname=aws-credential-1password
pkgver=0.1
pkgrel=1
pkgdesc='AWS credential helper using 1Password for storage'
arch=('any')
url='https://github.com/claui/aws-credential-1password'
license=('Apache')
depends=('1password-cli' 'jq')
optdepends=('aws-cli: Client that uses this helper')
options=('!strip')

source=(
  "${pkgname}-${pkgver}.tar.gz::https://github.com/claui/aws-credential-1password/archive/refs/tags/v${pkgver}.tar.gz"
)

sha512sums=(
  '8b3456f1bc473816dcb281a9b00d48effece992ea18f5b0939c087067b6e7745f354b138736e9bd7868eda8953909c0cf9867f669dd73a0f056f6d89138fbf08'
)

noextract=("${pkgname}-${pkgver}.tar.gz")

prepare() {
  tar -x \
    -f "${srcdir}/${pkgname}-${pkgver}.tar.gz" -z \
    -C "${srcdir}" --strip-components=1
}

package() {
  msg2 'Installing the license'
  install -D -m 644 -t "${pkgdir}/usr/share/licenses/${pkgname}" \
    "${srcdir}/LICENSE"

  msg2 'Installing `aws-credential-1password`'
  install -D -m 755 -t "${pkgdir}/usr/bin" \
    "${srcdir}/aws-credential-1password"

  msg2 'Installing documentation'
  install -D -m 644 -t "${pkgdir}/usr/share/doc/${pkgname}" \
    "${srcdir}/README.md"
}
