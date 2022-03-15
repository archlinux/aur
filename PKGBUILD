# Contributor: Filip <fila pruda com>
pkgname=poweradmin
pkgver=2.2.2.r23.g8041cd4
pkgrel=1
pkgdesc="web-based DNS administration tool for PowerDNS server"
arch=(any)
url="https://www.${pkgname}.org"
license=(GPL)
depends=(powerdns php)
makedepends=(git)
source=(git+https://github.com/${pkgname}/${pkgname}.git)
md5sums=('SKIP')
backup=('etc/webapps/${pkgname}/config.inc.php')

pkgver() {
  cd $pkgname
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
  _destdir="$pkgdir/usr/share/webapps/${pkgname}"
  _destdir_etc="$pkgdir/etc/webapps/${pkgname}"

  #source
  install -dm755 "$_destdir"
  cp -r $srcdir/$pkgname/* "$_destdir"

  mv "$_destdir/install" "$_destdir/x_install"
  chmod 700 "$_destdir/x_install"

  #config
  install -dm755 "$_destdir_etc"
  touch "$_destdir_etc/config.inc.php"
  ln -s "/etc/webapps/${pkgname}/config.inc.php" "$_destdir/inc/config.inc.php"
}
