# Maintainer: Que Quotion <quequotion@bugmenot.com>

pkgname=xscreensaver-dbus-screenlock
pkgver=4
pkgrel=1
pkgdesc="DE neutral integrated screen-locking with xscreensaver"
arch=('i686' 'x86_64')
url="http://ubuntuforums.org/showthread.php?t=1865593&s=1c7f28c50a3f258e1d3404e41f098a0b&p=11418175#post11418175"
license=('GPL')
depends=('xscreensaver' 'python' 'dbus')
optdepends=('indicator-session: Activate "Lock" from indicator')
provides=('gnome-screensaver' 'light-locker')
conflicts=('gnome-screensaver' 'light-locker')
source=(xscreensaver-dbus-screenlock-{freedesktop,gnome}.py
        org.{freedesktop,gnome}.ScreenSaver.service
        xscreensaver-dbus-screenlock-{freedesktop,gnome}.desktop
        'apps.light-locker.gschema.xml')
md5sums=('c7d3d86def974e678f62f5c778e3abfb'
         'a6888ae261adddb56d5ebffbe5487dc7'
         '9181f92d592549c5506a9722b47b7e94'
         '9181f92d592549c5506a9722b47b7e94'
         '65a7fb8a4d3e8183009e9caffc3e587a'
         '90ebf9aabc89691dd20f70c78506daea'
         '599874ebe25e03cbf95812ea8a6e8f25')

package() {

  #Python scripts
  install -Ddm755 "${pkgdir}/usr/bin"
  install -Dm755 {${srcdir}/xscreensaver-dbus-screenlock-{freedesktop,gnome}.py,${pkgdir}/usr/bin/}

  #Dbus services
  install -Ddm755 "${pkgdir}/usr/share/dbus-1/services"
  install -Dm644 {${srcdir}/org.{freedesktop,gnome}.ScreenSaver.service,${pkgdir}/usr/share/dbus-1/services/}

  #XDG Startups
  install -Ddm755 "${pkgdir}/etc/xdg/autostart"
  install -Dm644 {${srcdir}/xscreensaver-dbus-screenlock-{freedesktop,gnome}.desktop,${pkgdir}/etc/xdg/autostart/}

  #Gconf Schemas (for dependencies)
  install -Dm644 {${srcdir},${pkgdir}/usr/share/glib-2.0/schemas}/apps.light-locker.gschema.xml

  # Redirect stray calls to xscreensaver-command
  #install -Ddm755 "${pkgdir}/usr/bin/"
  #ln -s /usr/bin/xscreensaver-command "${pkgdir}/usr/bin/gnome-screensaver-command"
  #ln -s /usr/bin/xscreensaver-command "${pkgdir}/usr/bin/light-locker-command"
}

