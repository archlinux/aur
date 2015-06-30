# Maintainer: Sabart Otto - Seberm <seberm[at]gmail[dot]com>

pkgname=adminer
pkgver=4.2.1
pkgrel=1
pkgdesc="A full-featured MySQL management tool written in PHP"
arch=('any')
license=('Apache License, Version 2.0')
depends=('php') 
conflicts=('adminer-git')
optdepends=('mysql' 'apache' 'adminer-skins' 'postgresql' 'sqlite3')
url="http://www.adminer.org"
install=adminer.install
source=("http://downloads.sourceforge.net/${pkgname}/${pkgname}-${pkgver}.php")

package() {
  _instdir=$pkgdir/usr/share/webapps/$pkgname
  mkdir -p ${_instdir} $pkgdir/etc/webapps/$pkgname $pkgdir/etc/httpd/conf/extra

  install -D -m644 $srcdir/${pkgname}-${pkgver}.php $_instdir/index.php

  # It's similar to phpMyAdmin
  cat >$pkgdir/etc/webapps/$pkgname/apache.example.conf <<EOF
	Alias /${pkgname} "/usr/share/webapps/${pkgname}"
	<Directory "/usr/share/webapps/${pkgname}">
		AllowOverride All
		Options FollowSymlinks
		Require all granted
        php_admin_value open_basedir "/srv/:/tmp/:/usr/share/webapps/:/etc/webapps:/usr/share/pear/"
	</Directory>
EOF

  cp $pkgdir/etc/webapps/$pkgname/apache.example.conf $pkgdir/etc/httpd/conf/extra/httpd-${pkgname}.conf
#  echo "Include conf/extra/httpd-${pkgname}.conf" >> $pkgdir/etc/httpd/conf/httpd.conf

}

md5sums=('7b65ca8647349ca14d96735b414e439f')
