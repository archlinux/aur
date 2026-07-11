# Maintainer: coastland279 <archlinux.coastland279@passmail.com>
pkgname=python-config-parser-validator-bin
pkgver=1.0.1
pkgrel=1
pkgdesc="A minimalist Python parser for validated, typed configuration files using a simplified INI format."
arch=('any')
url="https://codeberg.org/plxqt/config-parser-validator"
license=('GPL-2.0-only')
depends=('python')
makedepends=('python-installer')
provides=('python-config-parser-validator')
conflicts=('python-config-parser-validator')

_base_url="https://codeberg.org/plxqt/config-parser-validator/releases/download/v${pkgver}"
source=(
  "${_base_url}/config_parser_validator-${pkgver}-py3-none-any.whl"
  "${_base_url}/config_parser_validator-${pkgver}-py3-none-any.whl.asc"
)
sha256sums=(
  'ee8cb3bc4c185c2e748bd361d49771d130bd87381ff42421d92cf5bd3cef3b9a'
  'SKIP'
)
validpgpkeys=('869DE48CE0FA85C0EA29365998081E96DB2FD7C3') # https://codeberg.org/rasping532 - author of the repo

package() {
  # install the wheel
  cd "${srcdir}"
  python -m installer --destdir="${pkgdir}" *.whl

  # copy license over to correct place
  # echo "$(ls -l "${pkgdir}/usr/lib/python"*"/site-packages/config_parser_validator-${pkgver}.dist-info/licenses/LICENSE")"
  install -Dm644 "${pkgdir}/usr/lib/python"*"/site-packages/config_parser_validator-${pkgver}.dist-info/licenses/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}/"
  # echo "$(ls -l "${pkgdir}/usr/share/licenses/${pkgname}")"
}