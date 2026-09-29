# Maintainer: MebTTY Maintainers

pkgname=mebtty
_pkgname=mebtty
pkgver=0.3.5
pkgrel=1
pkgdesc='Self-hosted web terminal that brings server shells to the browser'
arch=('x86_64')
url='https://github.com/mill413/mebtty'
license=('MIT')
depends=('glibc' 'openssl' 'pam' 'systemd')
options=('!debug')
install="${pkgname}.install"
source=(
  "mebtty.tmpfiles"
)
source_x86_64=(
  "${_pkgname}-${pkgver}-linux-amd64::${url}/releases/download/v${pkgver}/${_pkgname}-${pkgver}-linux-amd64"
  "${_pkgname}-${pkgver}.service::${url}/raw/v${pkgver}/mebtty.service"
  "${_pkgname}-${pkgver}.LICENSE::${url}/raw/v${pkgver}/LICENSE"
)
sha256sums=(
  'SKIP'
)
sha256sums_x86_64=(
  'ce8e4fcb28890d271e37ca821c4d70a3d253653d6c504299b1caf9620b0dc559'
  '4468b525021bc27e7bcfbbbd414378e593ef2c70381f3eed434228e82937b855'
  'aeeb73fc1446b76daaf4b9735e56dec39185df9cc944bf38b9ab3b80a116fc1f')

package() {
  install -Dm755 "${_pkgname}-${pkgver}-linux-amd64" "${pkgdir}/usr/bin/mebtty"

  sed 's|/usr/local/bin/mebtty|/usr/bin/mebtty|g' "${_pkgname}-${pkgver}.service" > mebtty.service.arch
  install -Dm644 mebtty.service.arch "${pkgdir}/usr/lib/systemd/system/mebtty.service"
  install -Dm644 mebtty.tmpfiles "${pkgdir}/usr/lib/tmpfiles.d/mebtty.conf"

  install -Dm644 "${_pkgname}-${pkgver}.LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
