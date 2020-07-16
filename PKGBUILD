# Maintainer: Felix Golatofski <contact@xdfr.de>
# Contributor: Jonathan Steel <jsteel at aur.archlinux.org>
# Contributor: Mariusz Derela <mariusz.derela@gmail.com>

pkgname=nagvis
pkgver=1.9.21
pkgrel=1
pkgdesc="Visualization addon for the well known network managment system Nagios"
license=('GPL')
arch=('any')
url="http://www.nagvis.org"
depends=('graphviz' 'php-sqlite' 'apache' 'php-apache')
install=$pkgname.install
backup=('usr/share/nagvis/etc/geomap/links.xml' 'usr/share/nagvis/etc/geomap/viewpoints.xml'
  'usr/share/nagvis/etc/geomap/locations.xml' 'usr/share/nagvis/etc/geomap/settings.xml'
  'usr/share/nagvis/etc/geomap/demo-locations.csv' 'usr/share/nagvis/etc/maps/demo-overview.cfg'
  'usr/share/nagvis/etc/maps/demo-automap2.cfg' 'usr/share/nagvis/etc/maps/demo-load.cfg'
  'usr/share/nagvis/etc/maps/demo-germany.cfg' 'usr/share/nagvis/etc/maps/demo-geomap.cfg'
  'usr/share/nagvis/etc/maps/demo-ham-racks.cfg' 'usr/share/nagvis/etc/maps/demo-muc-srv1.cfg'
  'usr/share/nagvis/etc/maps/demo-automap.cfg' 'usr/share/nagvis/etc/.htaccess'
  'usr/share/nagvis/etc/conf.d/demo.ini.php' 'etc/httpd/conf/extra/nagvis.conf')
source=("http://www.nagvis.org/share/$pkgname-$pkgver.tar.gz"
        $pkgname.conf)
sha256sums=('659f0947e466c4b5248d73ebf25dca3545c48a02853786446acbcae14c38df7e'
            'b0cd7ef38950c876d7ce99318eea9e835776e98cd28d469b4499285fbc29031f')

package() {
  cd "$srcdir"/$pkgname-$pkgver

  install -d "$pkgdir"/usr/share/$pkgname/

  cp -a etc share "$pkgdir"/usr/share/$pkgname/
  cp -a docs "$pkgdir"/usr/share/$pkgname/share/

  install -d "$pkgdir"/usr/share/$pkgname/{etc/profiles,var/tmpl/{compile,cache}}

  install -Dm 644 "$srcdir"/$pkgname.conf \
    "$pkgdir"/etc/httpd/conf/extra/$pkgname.conf
}
