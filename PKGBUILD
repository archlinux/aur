# Maintainer: Mikhail Velichko <efklid at gmail dot com>
# Contributor: Moon Sungjoon <sumoon at seoulsaram dot org>
# Contributor: Hurstel Alexandre <alexandre at hurstel dot eu>
# Contributor: Tobias Manske <aur at rad4day dot de>

pkgname=xp-pen-tablet
pkgver=3.4.9
pkgrel=231023
epoch=0
pkgdesc="XP-Pen (Official) Linux utility (New UI driver)"
arch=('x86_64')
url='https://www.xp-pen.com/download/index.html'
license=('custom')
source=("XPPenLinux${pkgver}-${pkgrel}.tar.gz::https://www.xp-pen.com/download/file/id/1936/pid/1016/ext/gz.html")
install=${pkgname}.install
options=(!strip)

sha512sums=('3732abdb444ae6ee0ff585b8fadb750761f194936054c392a3cf0e93f59468acedff79e864f6e751aac2b398e0ba6d951b55048ffe11bcb68c5b690062adf441')


package() {
       cp -r $srcdir/XPPenLinux${pkgver}-${pkgrel}/App/* $pkgdir
       cp -r $pkgdir/lib/* $pkgdir/usr/lib
       rm -r $pkgdir/lib
       #Licence  information
       install -Dm0644 $pkgdir/usr/lib/pentablet/doc/EULA $pkgdir/usr/share/licenses/${pkgname}/LICENSE
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
