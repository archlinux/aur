# Maintainer: Jeremy Kescher <jeremy@kescher.at>
# Contributor: Filip <fila pruda com>
pkgname=poweradmin
pkgver=3.2.0
pkgrel=1
pkgdesc="web-based DNS administration tool for PowerDNS server"
arch=(any)
url="https://www.poweradmin.org"
license=(GPL)
optdepends=("php: to locally host poweradmin")
provides=(poweradmin)
conflicts=(poweradmin)
source=("https://github.com/poweradmin/poweradmin/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('8f6070a980bba1578dcf251f357c74ad3e24ee91226779f0ec8955c5a856ad91')
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
