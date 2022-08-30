# Maintainer: AlphaJack <alphajack at tuta dot io>

pkgname="shlink"
pkgver=3.2.1
pkgrel=1
pkgdesc="The definitive self-hosted URL shortener"
url="https://shlink.io"
license=("MIT")
arch=("any")
depends=("php>=8.1" "php-gd")
optdepends=("mariadb: database"
            "mssql-server: database"
            "mysql: database"
            "postgresql: database"
            "sqlite: database"
            "apache: web server"
            "nginx: web server")
source=("https://github.com/shlinkio/shlink/releases/download/v$pkgver/$pkgname${pkgver}_php8.1_dist.zip")
sha256sums=('28f00e663e3c718fe856456953b2fab7e4adaaf6930bd18989ae835fa017a1e0')
install="$pkgname.install"
options=("!strip")

package(){
 cd "$pkgname${pkgver}_php8.0_dist"
 install -d "$pkgdir/usr/share/webapps/$pkgname"
 cp -r * "$pkgdir/usr/share/webapps/$pkgname"
 install -d "data" "$pkgdir/usr/share/webapps/$pkgname/data"
 chown -R http: "$pkgdir/usr/share/webapps/$pkgname/data"
 install -d -o http -g http -m 750 "config/params" "$pkgdir/usr/share/webapps/$pkgname/config/params"
 install -D -d -o http -g http -m 750 "$pkgdir/var/log/$pkgname"
 rm -r "$pkgdir/usr/share/webapps/$pkgname/data/log"
 ln -s "/var/log/$pkgname" "$pkgdir/usr/share/webapps/$pkgname/data/log"
}
