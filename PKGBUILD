# Maintainer: AlphaJack <alphajack at tuta dot io>

pkgname="roundcubemail-plugin-carddav"
pkgver=4.0.4
pkgrel=2
pkgdesc="CardDAV plugin for RoundCube Webmailer"
url="https://github.com/blind-coder/rcmcarddav"
license=("GPL2")
arch=("any")
conflicts=("roundcube-rcmcarddav" "roundcube-rcmcarddav-git" "roundcubemail-plugin-carddav-git")
replaces=("roundcube-rcmcarddav")
depends=("roundcubemail")
makedepends=("composer" "systemd")
source=("$url/releases/download/v$pkgver/carddav-v$pkgver.tgz")
sha256sums=("2eeed69e5ecb1584460a5f8b527a803959dcf885ae34a1b1f4af3c0c29893d3d")
backup=("etc/webapps/roundcubemail/plugins/carddav/config.inc.php")

build(){
 cd "carddav"
 composer install --no-interaction --no-dev
}

package(){
 cd "carddav"
 install -d "$pkgdir/usr/share/webapps/roundcubemail/plugins/carddav"
 cp -r * "$pkgdir/usr/share/webapps/roundcubemail/plugins/carddav"
 install -D -m 644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
 install -D -m 640 -o root -g http "config.inc.php.dist" "$pkgdir/etc/webapps/roundcubemail/plugins/carddav/config.inc.php"
 ln -s "/etc/webapps/roundcubemail/plugins/carddav/config.inc.php" "$pkgdir/usr/share/webapps/roundcubemail/plugins/carddav/config.inc.php"
}
