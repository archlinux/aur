# Maintainer: AlphaJack <alphajack at tuta dot io>

pkgname="roundcubemail-plugin-carddav"
pkgver=4.4.1
pkgrel=1
pkgdesc="CardDAV plugin for RoundCube Webmailer"
url="https://github.com/mstilkerich/rcmcarddav"
license=("GPL2")
arch=("any")
conflicts=("roundcube-rcmcarddav" "roundcube-rcmcarddav-git" "roundcubemail-plugin-carddav-git")
replaces=("roundcube-rcmcarddav")
# until roundcubemail 1.6 is available from official repos
depends=("roundcubemail<1.6")
makedepends=("composer" "systemd")
#source=("$url/releases/download/v$pkgver/carddav-v$pkgver.tar.gz")
source=("https://github.com/mstilkerich/rcmcarddav/releases/download/v$pkgver/carddav-v$pkgver-roundcube15.tar.gz")
sha256sums=('c9f64ecfa7c2ed86d60be130dcb01a59e394c86f71b684e923aa1cd32aa5d08b')
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
