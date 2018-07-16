# Maintainer: Filip <fila pruda com>
pkgname=poweradmin
pkgver=v2.1.6.r411.gb27f28b
pkgrel=1
pkgdesc="web-based DNS administration tool for PowerDNS server"
arch=('any')
url='http://www.poweradmin.org/'
license=('GPL')
depends=('powerdns' 'php')
makedepends=('git')
source=("git://github.com/poweradmin/poweradmin.git")
md5sums=('SKIP')
backup=('etc/webapps/poweradmin/config.inc.php')

pkgver() {
  cd "$srcdir/$pkgname"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {

  _destdir="$pkgdir/usr/share/webapps/poweradmin"
  _destdir_etc="$pkgdir/etc/webapps/poweradmin"

  #source
  install -dm755 "$_destdir"
  cp -r $srcdir/$pkgname/* "$_destdir"
  
  mv "$_destdir/install" "$_destdir/x_install"
  chmod 700 "$_destdir/x_install"
  

  #config
  install -dm755 "$_destdir_etc"
  touch "$_destdir_etc/config.inc.php"
  ln -s "/etc/webapps/poweradmin/config.inc.php" "$_destdir/inc/config.inc.php"
  
}