# Maintainer: Jeremy Kescher <jeremy@kescher.at>
# Contributor: Filip <fila pruda com>
pkgname=poweradmin
pkgver=3.4.2
pkgrel=1
pkgdesc="A web-based control panel for PowerDNS"
arch=(any)
url="https://www.poweradmin.org"
license=(GPL)
optdepends=("php: to locally host poweradmin")
provides=(poweradmin)
conflicts=(poweradmin)
source=("https://github.com/poweradmin/poweradmin/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('e0ea1fa87ed2e4fd1f499e379211e47524e11725b0f5d2ed46884d853c1dcdc1')
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
