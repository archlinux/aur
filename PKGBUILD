# Maintainer: dreieck

_pkgname=gerbera-openrc
pkgname="${_pkgname}"
pkgver=20211103.1
pkgrel=2
pkgdesc='OpenRC init script for gerbera daemon.'
url="https://gerbera.io/"
license=('GPL3')
arch=('any')
depends=('gerbera')
makedepends=()
optdepends=('openrc: To make use of this initscript.')
provides=()
replaces=()
conflicts=()
backup=(etc/conf.d/gerbera)
options=('!emptydirs')
source=(
  'gerbera.conf.d'
  'gerbera.openrc-initd'
  'copying-info.txt'
  'license-gpl3.txt::https://www.gnu.org/licenses/gpl-3.0.txt'
)
sha256sums=(
  '6b6e6f54c93618790de68474a7563936f0e33bee9184c0cb39ddf92648b2db12' # gerbera.conf.d
  '5a956efd9c5fa53185cb32d9c6c02592e7a5f2c77cffcc1bf3daf0646ea2301c' # gerbera.openrc-initd
  '8921a140fb29beec3e9a32cfc9a85c99d1c8718db806656cc443cbaf2bee8f1a' # copying-info.txt
  '3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986' # license-gpl3.txt
)

package() {
  install -D -v -m755 "${srcdir}/gerbera.openrc-initd" "${pkgdir}/etc/init.d/gerbera"
  install -D -v -m644 "${srcdir}/gerbera.conf.d" "${pkgdir}/etc/conf.d/gerbera"

  for _license in 'copying-info.txt' 'license-gpl3.txt'; do
    install -D -v -m644 "${srcdir}/${_license}" "${pkgdir}/usr/share/licenses/${pkgname}/${_license}"
  done
}
