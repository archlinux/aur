# Maintainer: Simon Gardling <titaniumtown@gmail.com>

pkgname=mutter-dev
_pkgname=mutter
pkgver=3.37.2
pkgrel=1
pkgdesc="A window manager for GNOME."
url="https://gitlab.gnome.org/GNOME/mutter"
arch=(x86_64)
license=(GPL)
depends=(dconf js68 gjs-dev gobject-introspection-runtime gsettings-desktop-schemas libcanberra sysprof-dev
         startup-notification zenity libsm gnome-desktop upower libxkbcommon-x11
         gnome-settings-daemon libgudev libinput pipewire)
makedepends=(intltool gobject-introspection git egl-wayland)
provides=(mutter)
conflicts=(mutter)
groups=(gnome)
source=("git+https://gitlab.gnome.org/GNOME/mutter.git")
sha256sums=('SKIP')

pkgver() {
  cd $_pkgname
  git describe --abbrev=0
}

build() {
  cd $_pkgname
  git checkout tags/$pkgver
  cd ..
  arch-meson "$_pkgname" build -D gtk_doc=true
  ninja -C build
}

package() {
  DESTDIR="$pkgdir" meson install -C build
}
