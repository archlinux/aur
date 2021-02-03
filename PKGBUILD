# Maintainer: AlphaJack <alphajack at tuta dot io>

pkgname="shlink"
pkgver=2.5.2
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
sha256sums=("c3d1ec27e9ca795a1ee894c0a95993d069cd4199b9bc773c63de6cb3745084ac")
install="$pkgname.install"

package(){
 cd "${pkgname}_${pkgver}_dist"
 install -d "$pkgdir/usr/share/webapps/$pkgname"
 cp -r * "$pkgdir/usr/share/webapps/$pkgname"
 install -d "data" "$pkgdir/usr/share/webapps/$pkgname/data"
 chown -R http: "$pkgdir/usr/share/webapps/$pkgname/data"
 install -d -o http -g http -m 750 "config/params" "$pkgdir/usr/share/webapps/$pkgname/config/params"
 install -D -d -o http -g http -m 750 "$pkgdir/var/log/$pkgname"
 rm -r "$pkgdir/usr/share/webapps/$pkgname/data/log"
 ln -s "/var/log/$pkgname" "$pkgdir/usr/share/webapps/$pkgname/data/log"
}
