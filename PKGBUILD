# Maintainer: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
# Contributor: Ionut Biru <ibiru@archlinux.org>
# Contributor: Roman Kyrylych <roman@archlinux.org>
# Contributor: Pellegrino Prevete <pellegrinoprevete@gmail.com>

_pkgname=gnome-bluetooth
pkgname=$_pkgname-git
pkgver=42.alpha+2+g65004396
pkgrel=1
pkgdesc="The GNOME Bluetooth Subsystem"
url="https://wiki.gnome.org/Projects/GnomeBluetooth"
arch=(x86_64)
license=(GPL LGPL)
depends=(gtk3
         libadwaita
         libnotify
         bluez
         libcanberra
         systemd-libs
         pipewire-pulse-git)
makedepends=(gobject-introspection
             gtk-doc
             docbook-xsl
             git
             systemd
             meson)
provides=(libgnome-bluetooth.so $_pkgname)
conflicts=($_pkgname)
source=("git+https://gitlab.gnome.org/GNOME/gnome-bluetooth.git")
sha256sums=('SKIP')

pkgver() {
  cd $_pkgname
  git describe --tags | sed 's/^GNOMEBT_V_//;s/_fixed//;s/_/./g;s/-/+/g'
}

prepare() {
  cd $_pkgname
}

build() {
  arch-meson $_pkgname build -D gtk_doc=true -D icon_update=false
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs
}

package() {
  DESTDIR="$pkgdir" meson install -C build
}

# vim:set sw=2 et:
