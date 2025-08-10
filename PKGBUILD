# Maintainer: AlphaJack <alphajack at tuta dot io>

pkgname="webtrees"
pkgver=2.2.4
pkgrel=1
pkgdesc="The web’s leading online collaborative genealogy application"
url="https://webtrees.net/"
license=("GPL3")
arch=("any")
depends=("php" "php-gd" "php-intl")
optdepends=("php-sqlite: sqlite3 database support")
source=("$pkgname-$pkgver.zip::https://github.com/fisharebest/webtrees/releases/download/$pkgver/$pkgname-$pkgver.zip")
b2sums=('adfc99f6adecb551c709ff57c947f1f7cb494b15cdac5582a0eaa539064aab853b4697a3a471f9946e8e70d5972e201f62fae34af1c4e05adcd7d0a19402dbdc')
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
