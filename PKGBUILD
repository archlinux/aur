# Maintainer: Claudio Cocciarelli <claudiococciarelli at gmail dot com>

pkgname=mutter-dev
_pkgname=mutter
pkgver=3.31.4
pkgrel=1
pkgdesc="A window manager for GNOME."
url="https://gitlab.gnome.org/GNOME/mutter"
arch=(x86_64)
license=(GPL)
depends=(dconf gobject-introspection-runtime gsettings-desktop-schemas libcanberra
         startup-notification zenity libsm gnome-desktop upower libxkbcommon-x11
         gnome-settings-daemon libgudev libinput pipewire)
makedepends=(intltool gobject-introspection git egl-wayland)
provides=(mutter)
conflicts=(mutter)
groups=(gnome)
source=("git+https://gitlab.gnome.org/GNOME/mutter.git#tag=$pkgver"
        "revert-gsettings-desktop-schemas-version.patch")
sha256sums=('SKIP'
            '77655e709343e4eaa3793675a6df4504c4e32e492f0f66cc8559b346751ff70f')

prepare() {
  cd "$_pkgname"

  patch -p1 -i ../revert-gsettings-desktop-schemas-version.patch
}

build() {
  arch-meson "$_pkgname" build
  ninja -C build
}

package() {
  DESTDIR="$pkgdir" meson install -C build
}
