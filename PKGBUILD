# Maintainer: Shalygin Konstantin <k0ste@k0ste.ru>
# Contributor: Shalygin Konstantin <k0ste@k0ste.ru>

pkgbase='netconsole'
pkgname="${pkgbase}"
_pkgname='initscripts'
pkgver='10.26'
pkgrel='1'
pkgdesc='Service for initializing of network console logging'
arch=('any')
url="https://github.com/fedora-sysv/${_pkgname}"
license=('GPL2')
depends=('sed' 'iproute2' 'iputils' 'util-linux' 'kmod')
conflicts=("systemd-${pkgname}")
source=("${url}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('cac382a2cc7644243db00e848d2334646520b88c10e841727dee42c726da21c4')
backup=("etc/sysconfig/${pkgname}")

package() {
  cd "${_pkgname}-${pkgver}"
  install -Dm0644 "etc/sysconfig/${pkgname}" -t "${pkgdir}/etc/sysconfig"
  install -Dm0644 "etc/rc.d/init.d/functions" -t "${pkgdir}/etc/rc.d/init.d"
  install -Dm0775 "usr/libexec/${pkgname}" -t "${pkgdir}/usr/libexec"
  install -Dm0644 "usr/lib/systemd/system/${pkgname}.service" -t "${pkgdir}/usr/lib/systemd/system"
}
