# Maintainer: Que Quotion <quequotion@bugmenot.com>

pkgname=xscreensaver-dbus-screenlock
pkgver=2
pkgrel=2
pkgdesc="Shell-integrated screen-locking with xscreensaver"
arch=('i686' 'x86_64')
url="http://ubuntuforums.org/showthread.php?t=1865593&s=1c7f28c50a3f258e1d3404e41f098a0b&p=11418175#post11418175"
license=('GPL')
depends=('xscreensaver' 'python' 'dbus')
optdepends=('indicator-session: Activate "Lock" from indicator')
provides=('gnome-screensaver' 'light-locker')
conflicts=('gnome-screensaver' 'light-locker')
source=('xscreensaver-dbus-screenlock-freedesktop.py'
        'xscreensaver-dbus-screenlock-gnome.py'
        'org.freedesktop.ScreenSaver.service'
        'org.gnome.ScreenSaver.service'
        'apps.light-locker.gschema.xml')
md5sums=('c7d3d86def974e678f62f5c778e3abfb'
         'a6888ae261adddb56d5ebffbe5487dc7'
         '9181f92d592549c5506a9722b47b7e94'
         '9181f92d592549c5506a9722b47b7e94'
         '599874ebe25e03cbf95812ea8a6e8f25')

package() {

  #Python scripts
  install -Dm755 {${srcdir},${pkgdir}/usr/bin}/xscreensaver-dbus-screenlock-freedesktop.py
  install -Dm755 {${srcdir},${pkgdir}/usr/bin}/xscreensaver-dbus-screenlock-gnome.py

  #Dbus services
  install -Dm644 {${srcdir},${pkgdir}/usr/share/dbus-1/services}/org.freedesktop.ScreenSaver.service
  install -Dm644 {${srcdir},${pkgdir}/usr/share/dbus-1/services}/org.gnome.ScreenSaver.service

  #Gconf Schemas (for dependencies)
  install -Dm644 {${srcdir},${pkgdir}usr/share/glib-2.0/schemas}/apps.light-locker.gschema.xml

  # Redirect stray calls to xscreensaver-command
  install -Ddm755 "${pkgdir}/usr/bin/"
  ln -s /usr/bin/xscreensaver-command "${pkgdir}/usr/bin/gnome-screensaver-command"
  ln -s /usr/bin/xscreensaver-command "${pkgdir}/usr/bin/light-locker-command"
}
