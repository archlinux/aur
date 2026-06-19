# Maintainer: MebTTY Maintainers

pkgname=mebtty
_pkgname=mebtty
pkgver=0.1.0
pkgrel=1
pkgdesc='Self-hosted web terminal that brings server shells to the browser'
arch=('x86_64')
url='https://github.com/mill413/mebtty'
license=('MIT')
depends=('glibc' 'openssl' 'systemd')
install="${pkgname}.install"
source_x86_64=(
  "${_pkgname}-${pkgver}-linux-amd64::${url}/releases/download/v${pkgver}/${_pkgname}-${pkgver}-linux-amd64"
  "mebtty.service::${url}/raw/v${pkgver}/mebtty.service"
  "LICENSE::${url}/raw/v${pkgver}/LICENSE"
)
sha256sums_x86_64=(
  'eb3b1c1b690744805ae78d01eeefd76135c9d1747b97b7b4889a3882a44fb349'
  '7f51f213114628b7c06cb9e3cae4bf4941a7a461050e9552930165fc9e8baa05'
  'aeeb73fc1446b76daaf4b9735e56dec39185df9cc944bf38b9ab3b80a116fc1f'
)

package() {
  install -Dm755 "${_pkgname}-${pkgver}-linux-amd64" "${pkgdir}/usr/bin/mebtty"

  sed 's|/usr/local/bin/mebtty|/usr/bin/mebtty|g' mebtty.service > mebtty.service.arch
  install -Dm644 mebtty.service.arch "${pkgdir}/usr/lib/systemd/system/mebtty.service"

  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -dm755 "${pkgdir}/etc/mebtty"
  install -dm755 "${pkgdir}/var/lib/mebtty/uploads"
}
