# Maintainer: AlphaJack <alphajack at tuta dot io>

pkgname=shlink
pkgver=2.3.0
pkgrel=1
pkgdesc="The definitive self-hosted URL shortener"
arch=("any")
url="https://github.com/shlinkio/shlink"
license=("MIT")
depends=("php>=7.4" "php-gd")
optdepends=("mariadb: database"
            "mssql-server: database"
            "mysql: database"
            "postgresql: database"
            "sqlite: database"
            "apache: web server"
            "nginx: web server")
source=("$url/releases/download/v$pkgver/${pkgname}_${pkgver}_dist.zip")
md5sums=("1d7e43ef5822f42e29db314b0c95df54")

package(){
 cd "$srcdir/${pkgname}_${pkgver}_dist"
 install -d "$pkgdir/usr/share/webapps/$pkgname"
 cp -rv * "$pkgdir/usr/share/webapps/$pkgname" 
 chown -R http: "$pkgdir/usr/share/webapps/$pkgname/data"

 install -d "$pkgdir/usr/share/licenses/$pkgname"
 install -D "LICENSE" "$pkgdir/usr/share/licenses/$pkgname"

 install -d "$pkgdir/var/log/"
 mv "$pkgdir/usr/share/webapps/$pkgname/data/log" "$pkgdir/var/log/$pkgname"
 ln -s "$pkgdir/var/log/$pkgname" "$pkgdir/usr/share/webapps/$pkgname/data/log"
 chown -R http: "$pkgdir/var/log/$pkgname"
}
