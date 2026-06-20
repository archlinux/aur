# Maintainer: MebTTY Maintainers

pkgname=mebtty
_pkgname=mebtty
pkgver=0.2.1
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
  "mebtty.service::${url}/raw/v${pkgver}/mebtty.service"
  "LICENSE::${url}/raw/v${pkgver}/LICENSE"
)
sha256sums=(
  'SKIP'
)
sha256sums_x86_64=(
  'b9e2335bc0eea98b36443b4b2455401394bb3c0fc82a6b676165e1633c8d6e3c'
  '70e4d4d8e88a7b9eeabb88b6d953db6c7e3efc7c995531fb0885b7cf565b8977'
  'aeeb73fc1446b76daaf4b9735e56dec39185df9cc944bf38b9ab3b80a116fc1f')

package() {
  install -Dm755 "${_pkgname}-${pkgver}-linux-amd64" "${pkgdir}/usr/bin/mebtty"

  sed 's|/usr/local/bin/mebtty|/usr/bin/mebtty|g' mebtty.service > mebtty.service.arch
  install -Dm644 mebtty.service.arch "${pkgdir}/usr/lib/systemd/system/mebtty.service"
  install -Dm644 mebtty.tmpfiles "${pkgdir}/usr/lib/tmpfiles.d/mebtty.conf"

  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
