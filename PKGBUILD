# Maintainer: AlphaJack <alphajack at tuta dot io>

pkgname="roundcubemail-plugin-carddav"
pkgver=5.0.0
pkgrel=1
pkgdesc="CardDAV plugin for RoundCube Webmailer"
url="https://github.com/mstilkerich/rcmcarddav"
license=("GPL2")
arch=("any")
conflicts=("roundcube-rcmcarddav" "roundcube-rcmcarddav-git" "roundcubemail-plugin-carddav-git")
replaces=("roundcube-rcmcarddav")
depends=("roundcubemail")
makedepends=("composer" "systemd")
source=("$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('c8a5c682c40a2be67fdd6b20278963c8c1639d0dfa911cd7cb8adb588efc42ee')
backup=("etc/webapps/roundcubemail/plugins/carddav/config.inc.php")
options=("!strip")

build(){
 cd "rcmcarddav-$pkgver"
 composer install --no-interaction --no-dev
}

package(){
 cd "rcmcarddav-$pkgver"
 install -d "$pkgdir/usr/share/webapps/roundcubemail/plugins/carddav"
 cp -r * "$pkgdir/usr/share/webapps/roundcubemail/plugins/carddav"
 install -D -m 640 -o root -g http "config.inc.php.dist" "$pkgdir/etc/webapps/roundcubemail/plugins/carddav/config.inc.php"
 ln -s "/etc/webapps/roundcubemail/plugins/carddav/config.inc.php" "$pkgdir/usr/share/webapps/roundcubemail/plugins/carddav/config.inc.php"
}
