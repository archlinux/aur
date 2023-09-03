# Maintainer: Mikhail Velichko <efklid at gmail dot com>
# Contributor: Moon Sungjoon <sumoon at seoulsaram dot org>
# Contributor: Hurstel Alexandre <alexandre at hurstel dot eu>
# Contributor: Tobias Manske <aur at rad4day dot de>

pkgname=xp-pen-tablet
pkgver=3.4.6
pkgrel=230714
epoch=0
pkgdesc="XP-Pen (Official) Linux utility (New UI driver)"
arch=('x86_64')
url='https://www.xp-pen.com/download/index.html'
license=('LGPL3')
source=("XPPenLinux${pkgver}-${pkgrel}.tar.gz::https://www.xp-pen.com/download/file/id/1936/pid/1016/ext/gz.html")
install=${pkgname}.install

sha512sums=('85cd54b938d76e7f3399b1e30265bf94d47fcc0d7e8f44cc1a0f019afef710223a54afd994550f4db60fda6e91caad266419754b1c61632b237a330bbef5ea87')


package() {
       cp -r $srcdir/XPPenLinux${pkgver}-${pkgrel}/App/* $pkgdir
       cp -r $pkgdir/lib/* $pkgdir/usr/lib
       rm -r $pkgdir/lib

       #No longer required, according to the new driver scripts
       #chmod 755 $pkgdir/usr/
       #chmod 755 $pkgdir/usr/lib/
       #chmod 755 $pkgdir/usr/share/
       #chmod 755 $pkgdir/usr/share/applications/
       #chmod 755 $pkgdir/usr/share/icons/
       #Moved from the official post_install() script to avoid errors during installation/updates
       #chmod 777 $pkgdir/usr/lib/pentablet/conf/xppen/
       #chmod 777 $pkgdir/usr/lib/pentablet/lib/
       #chmod 777 $pkgdir/usr/lib/pentablet/platforms/

       #Starting with version 3.4.6-230714, minimized startup is implemented directly by the developers.
       #Minimize GUI on autostartup
       #sed -re 's/(^Exec=\/.+)/\1 \/mini/gi' -i ${pkgdir}/etc/xdg/autostart/xppentablet.desktop
}
