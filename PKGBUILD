# Maintainer: Claudia Pellegrino <aur@cpellegrino.de>

pkgname=aws-credential-1password
pkgver=0.2
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
  'cf33c9bb033a2ae2509028057e267ddfa9e1f82993ebd3561c0e411775a46c7e3c22f913414d95ba53027e87677c177adeec23b90703b5bddd1294489aad8756'
)

noextract=("${pkgname}-${pkgver}.tar.gz")

prepare() {
  tar -x \
    -f "${srcdir}/${pkgname}-${pkgver}.tar.gz" -z \
    -C "${srcdir}" --strip-components=1
}

package() {
  echo >&2 'Packaging the license'
  install -D -m 644 -t "${pkgdir}/usr/share/licenses/${pkgname}" \
    "${srcdir}/LICENSE"

  echo >&2 'Packaging `aws-credential-1password`'
  install -D -m 755 -t "${pkgdir}/usr/bin" \
    "${srcdir}/aws-credential-1password"

  echo >&2 'Packaging documentation'
  install -D -m 644 -t "${pkgdir}/usr/share/doc/${pkgname}" \
    "${srcdir}/README.md"
}
