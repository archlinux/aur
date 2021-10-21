# Maintainer: AlphaJack <alphajack at tuta dot io>

pkgname="roundcubemail-plugin-carddav"
pkgver=4.2.1
pkgrel=2
pkgdesc="CardDAV plugin for RoundCube Webmailer"
url="https://github.com/mstilkerich/rcmcarddav"
license=("GPL2")
arch=("any")
conflicts=("roundcube-rcmcarddav" "roundcube-rcmcarddav-git" "roundcubemail-plugin-carddav-git")
replaces=("roundcube-rcmcarddav")
depends=("roundcubemail")
makedepends=("composer" "systemd")
source=("$url/releases/download/v$pkgver/carddav-v$pkgver.tar.gz")
sha256sums=('e4a2fba4465e3c0e199dbbf7c3c2a0b98ff3d5947917c12e26adf7cdc68d33c9')
backup=("etc/webapps/roundcubemail/plugins/carddav/config.inc.php")
options=("!strip")

build(){
 cd "carddav"
 composer install --no-interaction --no-dev
}

package(){
 cd "carddav"
 install -d "$pkgdir/usr/share/webapps/roundcubemail/plugins/carddav"
 cp -r * "$pkgdir/usr/share/webapps/roundcubemail/plugins/carddav"
 install -D -m 640 -o root -g http "config.inc.php.dist" "$pkgdir/etc/webapps/roundcubemail/plugins/carddav/config.inc.php"
 ln -s "/etc/webapps/roundcubemail/plugins/carddav/config.inc.php" "$pkgdir/usr/share/webapps/roundcubemail/plugins/carddav/config.inc.php"
}
