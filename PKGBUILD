# Maintainer: Yakov Till <yakov.till@gmail.com>

pkgname=pi-ext-commandcode
pkgver=0.8.3
pkgrel=1
pkgdesc='Command Code provider for the Pi coding agent (unofficial community integration)'
arch=('any')
url='https://github.com/patlux/pi-commandcode-provider'
license=('MIT')
install="${pkgname}.install"

_pi_pkgroot=/usr/lib/pi/packages
_piname=pi-commandcode-provider
_npmname=pi-commandcode-provider

source=("${_npmname}-${pkgver}.tgz::https://registry.npmjs.org/${_npmname}/-/${_npmname}-${pkgver}.tgz")
sha256sums=('6eaeb1d60b173d70ba395ec0031b5ab421c3fddeb3d3306e94fb23c66432127c')

latestver() {
  curl -fsSL "https://registry.npmjs.org/${_npmname}/latest" | jq -r '.version'
}

package() {
  # No prepare() step: the extension ships plain TypeScript and has no runtime
  # dependencies. Its only peers are @earendil-works/pi-ai and pi-coding-agent,
  # which the Pi process supplies.
  install -dm755 "${pkgdir}${_pi_pkgroot}"
  cp -a --no-preserve=ownership "${srcdir}/package" "${pkgdir}${_pi_pkgroot}/${_piname}"
  install -Dm644 "${srcdir}/package/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
