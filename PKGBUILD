# Maintainer: AlphaJack <alphajack at tuta dot io>

pkgname="roundcubemail-plugin-carddav-git"
pkgver=v4.0.0.alpha1.r60.ge3dbd51
pkgrel=1
pkgdesc="CardDAV plugin for RoundCube Webmailer"
arch=("any")
conflicts=("roundcube-rcmcarddav" "roundcube-rcmcarddav-git" "roundcubemail-plugin-carddav")
url="https://github.com/blind-coder/rcmcarddav"
license=("GPL2")
depends=("roundcubemail")
makedepends=("composer")
source=("$pkgname::git+$url.git")
md5sums=("SKIP")
backup=("etc/webapps/roundcubemail/plugins/carddav/config.inc.php")

pkgver(){
 cd "$srcdir/$pkgname"
 git describe --long --tags | sed "s/\([^-]*-g\)/r\1/;s/-/./g"
}

package() {
 cd "$srcdir/$pkgname"
 composer install --no-interaction --no-dev

 install -d "$pkgdir/usr/share/licenses/$pkgname"
 install -D "LICENSE" "$pkgdir/usr/share/licenses/$pkgname"

 install -d "$pkgdir/usr/share/webapps/roundcubemail/plugins/carddav"
 cp -r * "$pkgdir/usr/share/webapps/roundcubemail/plugins/carddav"

 install -Dm644 "config.inc.php.dist" "$pkgdir/etc/webapps/roundcubemail/plugins/carddav/config.inc.php"
 ln -s "/etc/webapps/roundcubemail/plugins/carddav/config.inc.php" "$pkgdir/usr/share/webapps/roundcubemail/plugins/carddav/config.inc.php"
}
