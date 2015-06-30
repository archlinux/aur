# Maintainer: Sabart Otto - Seberm <seberm[at]gmail[dot]com>

pkgname=adminer-editor
pkgver=4.2.1
pkgrel=1
pkgdesc="Database data editing tool written in PHP"
arch=('any')
license=('Apache License, Version 2.0')
depends=('php')
conflicts=('')
optdepends=('mariadb' 'apache' 'postgresql' 'sqlite' 'sqlite2')
url="http://www.adminer.org/en/editor/"
install=adminer-editor.install
source=("http://downloads.sourceforge.net/adminer/editor-${pkgver}.php")

package() {
  _instdir=$pkgdir/usr/share/webapps/$pkgname
  mkdir -p ${_instdir} $pkgdir/etc/webapps/$pkgname $pkgdir/etc/httpd/conf/extra

  install -D -m644 $srcdir/editor-${pkgver}.php $_instdir/index.php

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

md5sums=('4bad913d9a3d2d665692d2e32a190d2e')
