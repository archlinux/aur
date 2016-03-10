# Maintainer: Mario Finelli <mario at finel dot li>
# Contributor: Sabart Otto <seberm at gmail dot com>

pkgname=adminer
pkgver=4.2.4
pkgrel=1
pkgdesc="A full-featured MySQL management tool written in PHP."
arch=('any')
license=('Apache', 'GPL')
depends=('php')
conflicts=('adminer-git')
optdepends=('mysql' 'apache' 'adminer-skins' 'postgresql' 'sqlite3')
url="https://www.adminer.org"
install=${pkgname}.install
source=("${pkgname}.install"
        "httpd-${pkgname}.conf"
        "https://www.adminer.org/static/download/${pkgver}/${pkgname}-${pkgver}.php") 
sha256sums=('f3d2c8d2119cccf4d84d32ad2662300eecda62ffba7304505e563e192b5a10ef'
            '61057fd37bc77ae43110074220f7148055b34154f5f5a55e252aba1e19829b02'
            'ea21b95da1a2f66d26849160f3257823254663144e6b3b506c35160b70c7b3bd')

package() {
  _instdir=$pkgdir/usr/share/webapps/$pkgname
  mkdir -p ${_instdir} $pkgdir/etc/webapps/$pkgname $pkgdir/etc/httpd/conf/extra

  install -D -m644 $srcdir/${pkgname}-${pkgver}.php $_instdir/index.php

  cp $pkgdir/etc/webapps/$pkgname/apache.example.conf $pkgdir/etc/httpd/conf/extra/httpd-${pkgname}.conf
#  echo "Include conf/extra/httpd-${pkgname}.conf" >> $pkgdir/etc/httpd/conf/httpd.conf

}
