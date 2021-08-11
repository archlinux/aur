# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=gnome-shell-extension-disconnect-wifi-git
pkgver=28.r3.gfe23450
pkgrel=2
pkgdesc="Adds a disconnect option for Wifi in status menu"
arch=('any')
url="https://github.com/kgshank/gse-disconnect-wifi"
license=('GPL')
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
  _dest="usr/share/gnome-shell/extensions/$_uuid"

  cd $srcdir/gse-disconnect-wifi
  install -d "$pkgdir/$_dest"
  cp -r "$_uuid"/* "$pkgdir/$_dest"

  install -d "$pkgdir/usr/share/glib-2.0/schemas"
  ln -s "/$_dest/schemas/org.gnome.shell.extensions.disconnect-wifi.gschema.xml" \
    "$pkgdir/usr/share/glib-2.0/schemas"
}
