# Maintainer: Jeremy Kescher <jeremy@kescher.at>
# Contributor: Filip <fila pruda com>
pkgname=poweradmin-git
pkgver=3.2.0.r2.g6181224
pkgrel=1
pkgdesc="web-based DNS administration tool for PowerDNS server (git version)"
arch=(any)
url="https://www.poweradmin.org"
license=(GPL)
optdepends=("php: to locally host poweradmin")
makedepends=(git)
provides=(poweradmin)
conflicts=(poweradmin)
source=("git+https://github.com/poweradmin/poweradmin.git")
sha256sums=('SKIP')
backup=('etc/webapps/poweradmin/config.inc.php')

pkgver() {
  cd "poweradmin"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
  _destdir="${pkgdir}/usr/share/webapps/poweradmin"
  _destdir_etc="${pkgdir}/etc/webapps/poweradmin"

  install -dm755 "${_destdir}"
  cp -R --no-dereference --preserve=mode,links -v "${srcdir}/poweradmin/." "${_destdir}"
  rm -r "${_destdir}/.git"

  mv "${_destdir}/install" "${_destdir}/x_install"
  chmod 700 "${_destdir}/x_install"

  install -dm755 "${_destdir_etc}"
  touch "${_destdir_etc}/config.inc.php"
  ln -s "/etc/webapps/poweradmin/config.inc.php" "${_destdir}/inc/config.inc.php"
}
