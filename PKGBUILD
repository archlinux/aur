# Maintainer: M0Rf30

_pkg=cakephp
pkgname=cakephp2
pkgver=2.6.4
pkgrel=1
pkgdesc='The Rapid Development Framework for PHP'
arch=('any')
url='http://cakephp.org/'
license=('MIT')
depends=('php')
source=("$_pkg-$pkgver.tar.gz::https://github.com/$_pkg/$_pkg/tarball/$pkgver"
        'cake.sh'
	'httpd-cakephp2.conf')
options=('!strip')
webapps=usr/share/webapps

package() {
    cd $srcdir/cakephp-cakephp-*
    mkdir -p $pkgdir/$webapps
    cp -R $srcdir/cakephp-cakephp-* "$pkgdir/$webapps/cakephp2"
    install -D -m 755 "$srcdir/cake.sh" "$pkgdir/usr/bin/cake2"
    install -D -m 755 "$srcdir/httpd-cakephp2.conf" "$pkgdir/etc/webapps/cakephp2/httpd-cakephp2.conf"
    mkdir -p $pkgdir/var/log/httpd/cakephp2

# Fix permissions
    chmod 777 -R $pkgdir/$webapps/cakephp2/app/tmp/cache/
    chmod 777 -R $pkgdir/$webapps/cakephp2/lib/Cake/Console/Templates/skel/tmp/
# Database  
    mv $pkgdir/$webapps/cakephp2/app/Config/database.php.default $pkgdir/$webapps/cakephp2/app/Config/database.php
}

md5sums=('f1c60d68442693075474f881baee725c'
         'd0bd278b4ad99ff5ffa69161de14da29'
         '5f3cad61b94b911e697f45a00ac8b0e6')
