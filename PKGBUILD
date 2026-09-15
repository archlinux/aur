# Maintainer: Shalygin Konstantin <k0ste@k0ste.ru>
# Contributor: Shalygin Konstantin <k0ste@k0ste.ru>

pkgbase='netconsole'
pkgname="${pkgbase}"
_pkgname='initscripts'
pkgver='10.27'
pkgrel='1'
pkgdesc='Service for initializing of network console logging'
arch=('any')
_uri="github.com/fedora-sysv/${_pkgname}"
url="https://${_uri}"
license=('GPL2')
depends=('sed' 'iproute2' 'iputils' 'util-linux' 'kmod')
conflicts=("systemd-${pkgname}")
source=("${_pkgname}-${pkgver}.tar.gz::https://codeload.${_uri}/tar.gz/refs/tags/${pkgver}")
sha256sums=('5265f110f1d94e6719fa5e57f0f63ce490cc7eb66132fe75e30ffb653a597184')
backup=("etc/sysconfig/${pkgname}")

package() {
  cd "${_pkgname}-${pkgver}"
  install -Dm0644 "etc/sysconfig/${pkgname}" -t "${pkgdir}/etc/sysconfig"
  install -Dm0644 "etc/rc.d/init.d/functions" -t "${pkgdir}/etc/rc.d/init.d"
  install -Dm0775 "usr/libexec/${pkgname}" -t "${pkgdir}/usr/libexec"
  install -Dm0644 "usr/lib/systemd/system/${pkgname}.service" -t "${pkgdir}/usr/lib/systemd/system"
}
