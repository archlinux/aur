# Maintainer: Jean-Marc Lenoir
pkgname=cakebox
pkgver=1.8.6
pkgrel=1
pkgdesc="A small web interface to allows you to browse, watch, manage and share the files you want"
arch=('any')
license=('GPL2')
url="https://github.com/cakebox/cakebox"
backup=(etc/webapps/cakebox/config/default.php)
depends=('php')
makedepends=('composer' 'bower')
source=("https://github.com/$pkgname/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('105322a299bf702cb368648ddf9bedce3d9df5c328a7139e304c8ce4867a5def')

build() {
  cd $srcdir/$pkgname-$pkgver

  # composer & bower
  composer install
  bower install
}

package() {
  _destdir=$pkgdir/usr/share/webapps/cakebox
  _destdir_etc=$pkgdir/etc/webapps/cakebox

  install -dm755 ${_destdir}
  install -dm755 ${_destdir_etc}

  cd $srcdir/$pkgname-$pkgver
  cp -r . ${_destdir}

  # config
  mv ${_destdir}/config ${_destdir_etc}/
  ln -s /etc/webapps/cakebox/config ${_destdir}/config
  install -m644 ${_destdir_etc}/config/default.php.dist ${_destdir_etc}/config/default.php
}
