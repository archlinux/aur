# Maintainer: AlphaJack <alphajack at tuta dot io>

pkgname="roundcubemail-plugin-carddav"
pkgver=4.0.0
pkgrel=1
pkgdesc="CardDAV plugin for RoundCube Webmailer"
url="https://github.com/blind-coder/rcmcarddav"
license=("GPL2")
arch=("any")
conflicts=("roundcube-rcmcarddav" "roundcube-rcmcarddav-git" "roundcubemail-plugin-carddav-git")
depends=("roundcubemail")
makedepends=("composer")
source=("$url/releases/download/v$pkgver-alpha1/carddav-v$pkgver-alpha1.tgz")
md5sums=("525688b0e165821bc1843ac5be7628c6")
backup=("etc/webapps/roundcubemail/plugins/carddav/config.inc.php")

package() {
 cd "$srcdir/carddav"
 composer install --no-interaction --no-dev
 install -d "$pkgdir/usr/share/webapps/roundcubemail/plugins/carddav"
 cp -r * "$pkgdir/usr/share/webapps/roundcubemail/plugins/carddav"
 install -D -m 644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname"
 install -D -o root -g http -m 640 "config.inc.php.dist" "$pkgdir/etc/webapps/roundcubemail/plugins/carddav/config.inc.php"
 ln -s "/etc/webapps/roundcubemail/plugins/carddav/config.inc.php" "$pkgdir/usr/share/webapps/roundcubemail/plugins/carddav/config.inc.php"
}
