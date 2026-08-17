# Maintainer: MebTTY Maintainers

pkgname=mebtty
_pkgname=mebtty
pkgver=0.3.2
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
  'aeaabf8ce12b192c6c7a07301f70db375eaf948c3071cd37fa7841adb62fd985'
  'c9b2bdd5a5654e6443265ee3d395087cd8d8e81c1adabe3fe0887316fecbb1bc'
  'aeeb73fc1446b76daaf4b9735e56dec39185df9cc944bf38b9ab3b80a116fc1f')

package() {
  install -Dm755 "${_pkgname}-${pkgver}-linux-amd64" "${pkgdir}/usr/bin/mebtty"

  sed 's|/usr/local/bin/mebtty|/usr/bin/mebtty|g' "${_pkgname}-${pkgver}.service" > mebtty.service.arch
  install -Dm644 mebtty.service.arch "${pkgdir}/usr/lib/systemd/system/mebtty.service"
  install -Dm644 mebtty.tmpfiles "${pkgdir}/usr/lib/tmpfiles.d/mebtty.conf"

  install -Dm644 "${_pkgname}-${pkgver}.LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
