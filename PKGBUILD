# Maintainer: AlphaJack <alphajack at tuta dot io>

pkgname="shlink"
pkgver=2.4.0
pkgrel=2
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
md5sums=("65ab67e70cb2d97401997f99788dc5d4")
install="$pkgname.install"

package(){
 cd "${pkgname}_${pkgver}_dist"
 install -d "$pkgdir/usr/share/webapps/$pkgname"
 cp -r * "$pkgdir/usr/share/webapps/$pkgname"
 install -d "data" "$pkgdir/usr/share/webapps/$pkgname/data"
 chown -R http: "$pkgdir/usr/share/webapps/$pkgname/data"
 install -d -o http -g http -m 750 "config/params" "$pkgdir/usr/share/webapps/$pkgname/config/params"
 install -D -m 644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
 install -D -d -o http -g http -m 750 "$pkgdir/var/log/$pkgname"
 rm -r "$pkgdir/usr/share/webapps/$pkgname/data/log"
 ln -s "/var/log/$pkgname" "$pkgdir/usr/share/webapps/$pkgname/data/log"
}
