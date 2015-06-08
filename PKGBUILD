#Maintainer: Sapphira Armageddos <shadowkyogre at aim dot com>
#Contributor: Artem A Klevtsov <unikum.pm at gmail dot com>
pkgname=qtnotifydaemon
pkgver=1.0.14
pkgrel=4
pkgdesc="Configurable and flexible Qt notification daemon"
arch=('i686' 'x86_64')
url="http://sourceforge.net/projects/${pkgname}"
license=('GPL3')
depends=('qt4')
source=("http://downloads.sourceforge.net/project/${pkgname}/${pkgname}_${pkgver}.orig.tar.gz"
"override_icon_theme.patch"
'gcc4.7fix.patch')
md5sums=('af57385fb4acb48ce1ad40aaac369a4e'
         'cf6d30e755839eb05b5d63c6754a8524'
         '70c283997217001b12ee7721d17491fc')
install="${pkgname}.install"
conflicts=('notification-daemon' 'xfce4-notifyd' 'notify-osd')
provides=('notification-daemon' 'xfce4-notifyd' 'notify-osd')

build()  {
 cd ${srcdir}
 patch -Ni ${srcdir}/override_icon_theme.patch
 patch -Np1 -i ${srcdir}/gcc4.7fix.patch
 qmake-qt4 ${pkgname}.pro
 make
}

package() {
  cd ${srcdir}
  install -Dm 755 ${pkgname} ${pkgdir}/usr/bin/${pkgname}
  install -Dm 644 org.freedesktop.Notifications.service ${pkgdir}/usr/share/dbus-1/services/org.freedesktop.Notifications.service
  gzip debian/${pkgname}.1
  install -Dm 644 debian/${pkgname}.1.gz ${pkgdir}/usr/share/man/man1/${pkgname}.1.gz
}
