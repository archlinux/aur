# Maintainer: Ricardo Liang (rliang) <ricardoliang@gmail.com>

_pkgname=mutter
pkgname="$_pkgname"-git
pkgver=3.31.2+194+gfb38738fe
pkgrel=1
pkgdesc="A window manager for GNOME"
url="https://gitlab.gnome.org/GNOME/mutter"
arch=(x86_64)
license=(GPL)
provides=(mutter)
conflicts=(mutter mutter-dev)
depends=(dconf gobject-introspection-runtime gsettings-desktop-schemas-git libcanberra
         startup-notification zenity libsm gnome-desktop upower libxkbcommon-x11
         gnome-settings-daemon libgudev libinput pipewire)
makedepends=(gtk-doc gobject-introspection git egl-wayland meson)
groups=(gnome)
source=("git+https://gitlab.gnome.org/GNOME/mutter.git")
sha256sums=('SKIP')

pkgver() {
  cd $_pkgname
  git describe --tags | sed 's/-/+/g'
}

build() {
  arch-meson $_pkgname build -D gtk_doc=true
  ninja -C build
}

package() {
  DESTDIR="$pkgdir" meson install -C build
}
