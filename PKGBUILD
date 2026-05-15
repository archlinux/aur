# Maintainer: AlphaJack <alphajack at tuta dot io>

pkgname="webtrees"
pkgver=2.2.6
pkgrel=1
pkgdesc="The web’s leading online collaborative genealogy application"
url="https://webtrees.net/"
license=("GPL3")
arch=("any")
depends=("php" "php-gd" "php-intl")
optdepends=("php-sqlite: sqlite3 database support")
source=("$pkgname-$pkgver.zip::https://github.com/fisharebest/webtrees/releases/download/$pkgver/$pkgname-$pkgver.zip")
b2sums=('be9fee5d4f000c4fb17a7700cd593a4cc921e1b60d2703af6e490da451e85c05d00d443321ed8652304601fa8b3f98fe67586e7845b5a28fe692244b6ebd2521')
options=("!strip")

package(){
 cd "webtrees"
 # program files
 install -d "$pkgdir/usr/share/webapps/webtrees"
 cp -r * "$pkgdir/usr/share/webapps/webtrees"
 # program data
 install -d "$pkgdir/var/lib"
 mv "$pkgdir/usr/share/webapps/webtrees/data" "$pkgdir/var/lib/webtrees"
 ln -s "/var/lib/webtrees" "$pkgdir/usr/share/webapps/webtrees/data"
 chown -R http: "$pkgdir/var/lib/webtrees"
 chmod 700 "$pkgdir/var/lib/webtrees"
 # configuration
 # the main configuration file will be created automatically after the web wizard setup
 # if it found a link in /var/lib pointing to /etc/webapps, it would override it with a plain file
 # the best solution in this case is to keep the configuration file in /var/lib, and eventually
 # symlinking it to /etc/webapps for convenience
 install -d -m 750 "$pkgdir/etc/webapps/webtrees"
 ln -s "/var/lib/webtrees/config.ini.php" "$pkgdir/etc/webapps/webtrees"
}
