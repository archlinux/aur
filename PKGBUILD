# Maintainer: Que Quotion <quequotion@bugmenot.com>

pkgname=xscreensaver-dbus-screenlock
pkgver=1
pkgrel=4
pkgdesc="Shell-integrated screen-locking with xscreensaver"
arch=('i686' 'x86_64')
url="http://ubuntuforums.org/showthread.php?t=1865593&s=1c7f28c50a3f258e1d3404e41f098a0b&p=11418175#post11418175"
license=('GPL')
depends=('xscreensaver' 'python' 'dbus' 'gnome-settings-daemon-compat')
optdepends=('indicator-session: Activate "Lock" from indicator')
provides=('gnome-screensaver' 'light-locker')
conflicts=('gnome-screensaver' 'light-locker')
source=('xscreensaver-dbus-screenlock-freedesktop.py'
	'xscreensaver-dbus-screenlock-freedesktop.desktop'
        'xscreensaver-dbus-screenlock-gnome.py'
	'xscreensaver-dbus-screenlock-gnome.desktop')
md5sums=('c7d3d86def974e678f62f5c778e3abfb'
         '65a7fb8a4d3e8183009e9caffc3e587a'
         'a6888ae261adddb56d5ebffbe5487dc7'
         '90ebf9aabc89691dd20f70c78506daea')

package() {

  install -Dm755 {${srcdir},${pkgdir}/usr/bin}/xscreensaver-dbus-screenlock-freedesktop.py
  install -Dm755 {${srcdir},${pkgdir}/usr/bin}/xscreensaver-dbus-screenlock-gnome.py

  install -Dm644 {${srcdir},${pkgdir}/etc/xdg/autostart}/xscreensaver-dbus-screenlock-freedesktop.desktop
  install -Dm644 {${srcdir},${pkgdir}/etc/xdg/autostart}/xscreensaver-dbus-screenlock-gnome.desktop

  # Redirect stray calls to xscreensaver-command
  install -Ddm755 "${pkgdir}/usr/bin/"
  ln -s /usr/bin/xscreensaver-command "${pkgdir}/usr/bin/gnome-screensaver-command"
  ln -s /usr/bin/xscreensaver-command "${pkgdir}/usr/bin/light-locker-command"

}
