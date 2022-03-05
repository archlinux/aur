# Maintainer: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
# Contributor: Ionut Biru <ibiru@archlinux.org>
# Contributor: Roman Kyrylych <roman@archlinux.org>
# Contributor: Pellegrino Prevete <pellegrinoprevete@gmail.com>

_pkgname=gnome-bluetooth
pkgname=$_pkgname-git
pkgver=42.beta.2+10+g35a0c4c8
pkgrel=1
pkgdesc="The GNOME Bluetooth Subsystem"
url="https://wiki.gnome.org/Projects/GnomeBluetooth"
arch=(i686 pentium4 x86_64)
license=(GPL LGPL)
depends=(gtk3
         libadwaita-git
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
  arch-meson $_pkgname build -D gtk_doc=true
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs
}

package() {
  DESTDIR="$pkgdir" meson install -C build
}

# vim:set sw=2 et:
