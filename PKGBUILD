# Maintainer: Ignacy Kuchciński (ignapk) <ignacykuchcinski@gmail.com>

pkgname=mutter-git
_pkgname=mutter
pkgver=40.beta+16+g3bbfaa03b
pkgrel=1
pkgdesc="A window manager for GNOME."
url="https://gitlab.gnome.org/GNOME/mutter"
arch=(x86_64)
license=(GPL)
depends=(dconf js68 gjs-git gobject-introspection-runtime gsettings-desktop-schemas-git libcanberra sysprof-git
         startup-notification zenity libsm gnome-desktop upower libxkbcommon-x11 glib2-git
         gnome-settings-daemon libgudev libinput pipewire-git jack2 xorg-server-xwayland-git)
makedepends=(intltool gobject-introspection git egl-wayland xorg-server)
provides=(mutter)
conflicts=(mutter)
groups=(gnome)
source=("git+https://gitlab.gnome.org/GNOME/mutter.git")
sha256sums=('SKIP')

pkgver() {
  cd $_pkgname
  git describe --tags | sed 's/-/+/g'
}

build() {
  arch-meson "$_pkgname" build
  ninja -C build
}

package() {
  DESTDIR="$pkgdir" meson install -C build
}
