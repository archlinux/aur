# Maintainer: Sergio Schneider <spsf64 at g m a i l . c o m>
# Contributor: Mike Krüger

## useful links
# https://launchpad.net/gencfsm
# https://moritzmolch.com/apps/gencfsm.html

pkgname=gnome-encfs-manager-bin
_pkgname=gnome-encfs-manager
pkgver=1.9
pkgrel=4
pkgdesc="An easy to use manager and mounter for encfs stashes"
url="https://moritzmolch.com/apps/gencfsm.html"
license=('GPL-2.0-or-later')
arch=('x86_64')

provides=('gnome-encfs-manager')
conflicts=('gnome-encfs-manager')

source=("https://download.opensuse.org/repositories/home:/moritzmolch:/gencfsm/Debian_10/amd64/gnome-encfs-manager_${pkgver}_amd64.deb")
sha256sums=('2d7d1bcbed13175a869e64de0873ee8218663b470d21c21a1fc4f83d0f84af5d')

prepare() {
  ar vx "gnome-encfs-manager_${pkgver}_amd64.deb"
  tar -xf data.tar.xz
}
package() {
  depends+=(
    'encfs'
    'gtk3'
    'libappindicator-gtk3'
    'libgee'
    'libice'
    'libsecret'
    'libsm'
  )

  install -d "$pkgdir/usr/bin"
  install -m755 "$srcdir/usr/bin/$_pkgname" "$pkgdir/usr/bin/"

  install -d "$pkgdir/usr/share"
  install -d "$pkgdir/usr/share/applications"
  install -Dm644 "$srcdir/usr/share/applications/$_pkgname.desktop" "$pkgdir/usr/share/applications/"

  install -d "$pkgdir/usr/share/dbus-1/services/"
  install -Dm644 "$srcdir/usr/share/dbus-1/services/com.libertyzero.gnome-encfs-manager.service" "$pkgdir/usr/share/dbus-1/services/"

  install -d "$pkgdir/usr/share/glib-2.0/schemas/"
  install -Dm644 "$srcdir/usr/share/glib-2.0/schemas/com.libertyzero.gnome-encfs-manager.gschema.xml" "$pkgdir/usr/share/glib-2.0/schemas/"

  install -d "$pkgdir/usr/share/gnome-encfs-manager/"
  mv "$srcdir/usr/share/gnome-encfs-manager"/* "$pkgdir/usr/share/gnome-encfs-manager/"

  install -d "$pkgdir/usr/share/icons/"
  mv "$srcdir/usr/share/icons"/* "$pkgdir/usr/share/icons/"

  install -d "$pkgdir/usr/share/locale/"
  mv "$srcdir/usr/share/locale"/* "$pkgdir/usr/share/locale/"
}
