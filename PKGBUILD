# Maintainer: AlphaJack <alphajack at tuta dot io>

pkgname="webtrees"
pkgver=2.0.16
pkgrel=1
pkgdesc="The web’s leading online collaborative genealogy application"
url="https://webtrees.net/"
license=("GPL3")
arch=("any")
depends=("php>=7.1")
source=("https://github.com/fisharebest/webtrees/releases/download/$pkgver/webtrees-$pkgver.zip")
sha256sums=('c9327e92df83b3ccfa73d4a5c963357ab25be7daa471fa4ecb157f06b9615366')
options=("!strip")

package(){
 cd "webtrees"
 install -d "$pkgdir/usr/share/webapps/webtrees"
 cp -r * "$pkgdir/usr/share/webapps/webtrees"

 install -d "$pkgdir/var/lib"
 mv "$pkgdir/usr/share/webapps/webtrees/data" "$pkgdir/var/lib/webtrees"
 ln -s "/var/lib/webtrees" "$pkgdir/usr/share/webapps/webtrees/data"
 chown -R http: "$pkgdir/var/lib/webtrees"
 chmod 750 "$pkgdir/var/lib/webtrees"

 # main configuration file will be created at the first launch as /var/lib/webtrees/config.ini.php
}
