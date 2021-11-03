# Maintainer: dreieck

_pkgname=minissdpd-openrc
pkgname="${_pkgname}"
pkgver=20211103.1
pkgrel=1
pkgdesc='OpenRC init script for minissdpd daemon.'
url='https://miniupnp.tuxfamily.org/minissdpd.html'
license=('GPL3')
arch=('any')
depends=('minissdpd')
makedepends=()
optdepends=('openrc: To make use of this initscript.')
provides=()
replaces=()
conflicts=()
backup=(etc/conf.d/minissdpd)
options=('!emptydirs')
install="${_pkgname}.install"
source=(
  'minissdpd.conf.d'
  'minissdpd.openrc-initd'
  'copying-info.txt'
  'license-gpl3.txt::https://www.gnu.org/licenses/gpl-3.0.txt'
  "${install}"
)
sha256sums=(
  '0b59887884b83db5130de2de457a366b03a018bedcafb9e24e8e07ed1c06ac75' # minissdpd.conf.d
  '9f7863da9c0b7f5195964bfa9aab15a6b048c74a524a89191f81ce5146061916' # minissdpd.openrc-initd
  '8921a140fb29beec3e9a32cfc9a85c99d1c8718db806656cc443cbaf2bee8f1a' # copying-info.txt
  '3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986' # license-gpl3.txt
  '0edf2cf0a848660aaf790b0f151474bcc736aa29ed4e740c022b24d7716bbde1' # $install
)

package() {
  install -D -v -m755 "${srcdir}/minissdpd.openrc-initd" "${pkgdir}/etc/init.d/minissdpd"
  install -D -v -m644 "${srcdir}/minissdpd.conf.d" "${pkgdir}/etc/conf.d/minissdpd"

  for _license in 'copying-info.txt' 'license-gpl3.txt'; do
    install -D -v -m644 "${srcdir}/${_license}" "${pkgdir}/usr/share/licenses/${pkgname}/${_license}"
  done
}
