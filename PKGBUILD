# Maintainer: Mikhail Velichko <efklid at gmail dot com>
# Contributor: Moon Sungjoon <sumoon at seoulsaram dot org>
# Contributor: Hurstel Alexandre <alexandre at hurstel dot eu>
# Contributor: Tobias Manske <aur at rad4day dot de>

pkgname=xp-pen-tablet
pkgver=3.3.9.230222
pkgrel=1
epoch=0
pkgdesc="XP-Pen (Official) Linux utility (New UI driver)"
arch=('x86_64')
url='https://www.xp-pen.com/download/index.html'
license=('LGPL3')
source=("XPPen-pentablet-${pkgver}-1.${arch}.deb::https://www.xp-pen.ru/download/file/id/1954/pid/143/ext/deb.html")
install=${pkgname}.install

sha512sums=('a1af3119802b786d3307fe5d7f7fccb383cc6a2cbef91e1713d63a522d86fc581bb87fc3e0522a5dbb961945e63e47589d0a8f447010d10c4f623f05e7ac99f3')


package() {
       cd $srcdir
       ar x *.deb
       bsdtar xf data.tar.xz -C $pkgdir
       cp -r $pkgdir/lib/* $pkgdir/usr/lib
       rm -r $pkgdir/lib
       chmod 755 $pkgdir/usr/
       chmod 755 $pkgdir/usr/lib/
       chmod 755 $pkgdir/usr/share/
       chmod 755 $pkgdir/usr/share/applications/
       chmod 755 $pkgdir/usr/share/icons/
       #Moved from the official post_install() script to avoid errors during installation/updates
       chmod 777 $pkgdir/usr/lib/pentablet/conf/xppen/
       chmod 777 $pkgdir/usr/lib/pentablet/lib/
       chmod 777 $pkgdir/usr/lib/pentablet/platforms/
       #Minimize GUI on autostartup
       sed -re 's/(^Exec=\/.+)/\1 \/mini/gi' -i ${pkgdir}/etc/xdg/autostart/xppentablet.desktop
}
