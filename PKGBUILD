# Maintainer: AlphaJack <alphajack at tuta dot io>

pkgname=shlink
pkgver=2.3.0
pkgrel=1
pkgdesc="The definitive self-hosted URL shortener"
url="https://shlink.io"
license=("MIT")
arch=("any")
depends=("php>=7.4" "php-gd")
optdepends=("mariadb: database"
            "mssql-server: database"
            "mysql: database"
            "postgresql: database"
            "sqlite: database"
            "apache: web server"
            "nginx: web server")
source=("https://github.com/shlinkio/shlink/releases/download/v$pkgver/${pkgname}_${pkgver}_dist.zip")
md5sums=("1d7e43ef5822f42e29db314b0c95df54")

package(){
 cd "${pkgname}_${pkgver}_dist"
 install -d "$pkgdir/usr/share/webapps/$pkgname"
 cp -r * "$pkgdir/usr/share/webapps/$pkgname"
 install -d "data" "$pkgdir/usr/share/webapps/$pkgname/data"
 chown -R http: "$pkgdir/usr/share/webapps/$pkgname/data"
 install -d -o http -g http -m 750 "config/params" "$pkgdir/usr/share/webapps/$pkgname/config/params"
 install -D -m 644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
 install -D -d -o http -g http -m 750 "$pkgdir/usr/share/webapps/$pkgname/data/log" "$pkgdir/var/log/$pkgname"
 ln -s "/var/log/$pkgname" "$pkgdir/usr/share/webapps/$pkgname/data/log"
}
