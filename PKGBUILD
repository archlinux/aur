# Maintainer: AlphaJack <alphajack at tuta dot io>

pkgname="roundcubemail-plugin-carddav"
pkgver=4.4.4
pkgrel=1
pkgdesc="CardDAV plugin for RoundCube Webmailer"
url="https://github.com/mstilkerich/rcmcarddav"
license=("GPL2")
arch=("any")
conflicts=("roundcube-rcmcarddav" "roundcube-rcmcarddav-git" "roundcubemail-plugin-carddav-git")
replaces=("roundcube-rcmcarddav")
depends=("roundcubemail")
makedepends=("composer" "systemd")
source=("$url/releases/download/v$pkgver/carddav-v$pkgver.tar.gz")
sha256sums=('1682a6c22a66dff59a2391fe123f03fb23b0832de47175a7a7a0b58f861f0c01')
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
