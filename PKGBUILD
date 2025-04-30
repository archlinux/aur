# Maintainer: dreieck

_pkgname=gerbera-openrc
pkgname="${_pkgname}"
pkgver=20211103.2
pkgrel=3
pkgdesc='OpenRC init script for gerbera daemon.'
url="https://gerbera.io/"
license=('GPL-3.0-or-later')
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
  'a41f4907556d7af393dbd946477a1e870caaf0c5777b0e501bf6a0967d255fd0' # gerbera.conf.d
  '476f0ec0de1e99c1f04d5e94c45d3d85c3763d6afefb3f6b24c419ff37b904c5' # gerbera.openrc-initd
  '1ddf07ffa45a6c1a7f8f6a01a6ab5dfb22d7ae5bbfdaa9fc28385f238bc63b86' # copying-info.txt
  '3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986' # license-gpl3.txt
)

package() {
  install -D -v -m755 "${srcdir}/gerbera.openrc-initd" "${pkgdir}/etc/init.d/gerbera"
  install -D -v -m644 "${srcdir}/gerbera.conf.d" "${pkgdir}/etc/conf.d/gerbera"

  for _license in 'copying-info.txt' 'license-gpl3.txt'; do
    install -D -v -m644 "${srcdir}/${_license}" "${pkgdir}/usr/share/licenses/${pkgname}/${_license}"
  done
}
