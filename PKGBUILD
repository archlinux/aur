# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=gnome-shell-extension-disconnect-wifi-git
pkgver=28.r5.gdaa2ee9
pkgrel=2
pkgdesc="Adds a disconnect option for Wifi in status menu"
arch=('any')
url="https://github.com/kgshank/gse-disconnect-wifi"
license=('GPL3')
depends=('gnome-shell')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('git+https://github.com/kgshank/gse-disconnect-wifi.git')
sha256sums=('SKIP')

pkgver() {
  cd $srcdir/gse-disconnect-wifi
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
  _uuid='disconnect-wifi@kgshank.net'
  _schema='org.gnome.shell.extensions.disconnect-wifi.gschema.xml'

  cd $srcdir/gse-disconnect-wifi
  rm "$_uuid"/{disconnect-wifi.pot,license}
  install -d "$pkgdir/usr/share/gnome-shell/extensions/"
  cp -r "$_uuid/" "$pkgdir/usr/share/gnome-shell/extensions/"

  install -d "$pkgdir/usr/share/glib-2.0/schemas/"
  ln -s "/usr/share/gnome-shell/extensions/$_uuid/schemas/$_schema" \
    "$pkgdir/usr/share/glib-2.0/schemas/"
}
