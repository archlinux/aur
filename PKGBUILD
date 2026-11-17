# Maintainer: Yakov Till <yakov.till@gmail.com>

pkgname=pi-ext-commandcode
pkgver=0.8.6
pkgrel=1
pkgdesc='Command Code provider for the Pi coding agent (unofficial community integration)'
arch=('any')
url='https://github.com/patlux/pi-commandcode-provider'
license=('MIT')
install="${pkgname}.install"

_pi_pkgroot=/usr/share/pi/extensions
_piname=pi-commandcode-provider
_npmname=pi-commandcode-provider

source=("${_npmname}-${pkgver}.tgz::https://registry.npmjs.org/${_npmname}/-/${_npmname}-${pkgver}.tgz")
sha256sums=('f27f2c9853134c72871afdf4f0d51432d5c845d6440825c035fddae73b8ef0c0')

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
