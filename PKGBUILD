# Maintainer: Gordian Edenhofer <gordian.edenhofer[at]yahoo[dot]de>
# Submitter: Steffen L. Norgren (incongruous) <steffen[at]norgren[dot]ca>

pkgname=flattr-icon-theme-git
pkgver=560.222f37e
pkgrel=1
pkgdesc="An icon theme for Linux desktops, the set is inspired by the latest flat design trend."
arch=('any')
url="https://github.com/NitruxSA/flattr-icons"
license=('custom:CC BY-SA 4.0')
depends=('librsvg')
makedepends=('git')
provides=('flattr-icon-theme')
conflicts=('flattr-icon-theme' 'flattr-icons-kde' 'flattr-icons-kde-kaosx' 'flattr-icons-kde-kaosx-git')
install=${pkgname}.install
source=("${pkgname}"::'git+https://github.com/NitruxSA/flattr-icons.git')
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/${pkgname}"
  echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

package() {
  cd "${srcdir}/${pkgname}"

  install -dm755 "${pkgdir}"/usr/share/licenses/${pkgname}
  install -dm755 "${pkgdir}"/usr/share/icons/Flattr
  install -dm755 "${pkgdir}"/usr/share/icons/Flattr\ Dark

  cp -dpr --no-preserve=ownership ./Flattr/LICENSE "${pkgdir}"/usr/share/licenses/${pkgname}/
  cp -dpr --no-preserve=ownership ./Flattr "${pkgdir}"/usr/share/icons/
  cp -dpr --no-preserve=ownership ./Flattr\ Dark "${pkgdir}"/usr/share/icons/
  cp -dpr --no-preserve=ownership ./tools "${pkgdir}"/usr/share/icons/Flattr/

  rm "${pkgdir}"/usr/share/icons/Flattr/LICENSE
}
