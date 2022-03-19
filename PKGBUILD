# Maintainer: Jeremy Kescher <jeremy@kescher.at>
# Contributor: Filip <fila pruda com>
pkgname=poweradmin
pkgver=2.2.2
pkgrel=1
pkgdesc="web-based DNS administration tool for PowerDNS server"
arch=(any)
url="https://www.poweradmin.org"
license=(GPL)
depends=(powerdns php)
source=("https://github.com/poweradmin/poweradmin/archive/refs/tags/v2.2.2.tar.gz")
sha256sums=('5f966932b9d2edb46ccf128cb2b48cb5c5394838eba2b43f528cbc977b00a6ba')
backup=('etc/webapps/poweradmin/config.inc.php')

package() {
  _destdir="${pkgdir}/usr/share/webapps/poweradmin"
  _destdir_etc="${pkgdir}/etc/webapps/poweradmin"

  install -dm755 "${_destdir}"
  cp -R --no-dereference --preserve=mode,links -v "${srcdir}/poweradmin-${pkgver}/." "${_destdir}"

  mv "${_destdir}/install" "${_destdir}/x_install"
  chmod 700 "${_destdir}/x_install"

  install -dm755 "${_destdir_etc}"
  touch "${_destdir_etc}/config.inc.php"
  ln -s "/etc/webapps/poweradmin/config.inc.php" "${_destdir}/inc/config.inc.php"
}
