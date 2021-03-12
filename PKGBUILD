# Maintainer: AlphaJack <alphajack at tuta dot io>

pkgname="shlink"
pkgver=2.6.2
pkgrel=1
pkgdesc="The definitive self-hosted URL shortener"
url="https://shlink.io"
license=("MIT")
arch=("any")
depends=("php>=8.0" "php-gd")
optdepends=("mariadb: database"
            "mssql-server: database"
            "mysql: database"
            "postgresql: database"
            "sqlite: database"
            "apache: web server"
            "nginx: web server")
source=("https://github.com/shlinkio/shlink/releases/download/v$pkgver/$pkgname${pkgver}_php8.0_dist.zip")
sha256sums=("f78cc93bc732ebfa257bf8e78f46db0dff785e8fb49aeec327f3be25c139bf5c")
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
