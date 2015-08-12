# $Id$
# Maintainer: Balló György <ballogyor+arch at gmail dot com>

pkgname=command-runner-applet
pkgver=0.4
pkgrel=1
pkgdesc="Applet for GNOME Flashback panel which periodically displays a command output"
arch=('any')
url="https://github.com/porridge/command-runner-applet"
license=('GPL')
depends=('gnome-panel' 'python-gobject')
install=$pkgname.install
source=($pkgname-$pkgver.tar.gz::https://github.com/porridge/$pkgname/archive/upstream/$pkgver.tar.gz
        python3-port.patch)
md5sums=('d6587f80cd96c0f7ea2a7a429a6e8cb1'
         '25452bb3ad4723cc164b469a819c75dc')

prepare() {
  cd $pkgname-upstream-$pkgver

  # Port to Python 3
  patch -Np1 -i ../python3-port.patch
}

package() {
  cd $pkgname-upstream-$pkgver

  install -Dm644 CommandRunnerApplet.panel-applet "$pkgdir/usr/share/gnome-panel/5.0/applets/CommandRunnerApplet.panel-applet"
  install -Dm644 CommandRunnerAppletFactory.service "$pkgdir/usr/share/dbus-1/services/CommandRunnerAppletFactory.service"
  install -Dm644 command_runner.png "$pkgdir/usr/share/pixmaps/command_runner.png"
  install -Dm755 command_runner "$pkgdir/usr/share/command-runner-applet/command_runner"
  install -Dm644 org.gnome.gnome-panel.applet.command-runner.gschema.xml \
          "$pkgdir/usr/share/glib-2.0/schemas/org.gnome.gnome-panel.applet.command-runner.gschema.xml"
  install -Dm644 command-runner-applet.convert "$pkgdir/usr/share/GConf/gsettings/command-runner-applet.convert"

}
