# Maintainer: AlphaJack <alphajack at tuta dot io>

pkgname="webtrees"
pkgver=2.0.19
pkgrel=2
pkgdesc="The web’s leading online collaborative genealogy application"
url="https://webtrees.net/"
license=("GPL3")
arch=("any")
depends=("php>=7.1")
source=("https://github.com/fisharebest/webtrees/releases/download/$pkgver/webtrees-$pkgver.zip")
sha256sums=('e1437a8fa9ca79a64e2fd065fad0c026e98b066e1a7bad1a30838f3b80df5b25')
backup=("var/lib/webtrees/.htaccess" "var/lib/webtrees/index.php")
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

 # main configuration file will need to be created manually after the web wizard setup ends
}
