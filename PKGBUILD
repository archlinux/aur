# Maintainer: Yakov Till <yakov.till@gmail.com>

pkgname=pi-ext-background
pkgver=0.4.8
pkgrel=1
pkgdesc='Run long commands in the background and wake the Pi coding agent when they finish'
arch=('any')
url='https://github.com/Pringled/pi-extensions'
license=('MIT')
install="${pkgname}.install"

_pi_pkgroot=/usr/share/pi/extensions
_piname=pi-background
_npmname=pi-background

source=("${_npmname}-${pkgver}.tgz::https://registry.npmjs.org/${_npmname}/-/${_npmname}-${pkgver}.tgz")
sha256sums=('bd0b806937fa3cce7f39a7e38dd3bab028afc8129cafdf372e264b04edbb1a21')

latestver() {
  curl -fsSL "https://registry.npmjs.org/${_npmname}/latest" | jq -r '.version'
}

package() {
  # No prepare(): the extension ships plain TypeScript with no runtime
  # dependencies. Its only peers are host-provided Pi packages and typebox.
  install -dm755 "${pkgdir}${_pi_pkgroot}"
  cp -a --no-preserve=ownership "${srcdir}/package" "${pkgdir}${_pi_pkgroot}/${_piname}"
  install -Dm644 "${srcdir}/package/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
