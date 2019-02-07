# Maintainer: Claudio Cocciarelli <claudiococciarelli at gmail dot com>

pkgname=gnome-shell-dev
_pkgname=gnome-shell
pkgver=3.31.90
pkgrel=1
pkgdesc="Next generation desktop shell"
url="https://gitlab.gnome.org/GNOME/gnome-shell"
arch=(x86_64)
license=(GPL2)
depends=(accountsservice gcr gjs gnome-bluetooth upower gnome-session gnome-settings-daemon
         gnome-themes-extra gsettings-desktop-schemas libcanberra-pulse libcroco libgdm libsecret
         mutter-dev nm-connection-editor unzip gstreamer libibus)
makedepends=(gtk-doc gnome-control-center evolution-data-server gobject-introspection git meson
             sassc)
optdepends=('gnome-control-center: System settings'
            'evolution-data-server: Evolution calendar integration')
groups=(gnome)
provides=(gnome-shell)
conflicts=(gnome-shell)
source=("git+https://gitlab.gnome.org/GNOME/gnome-shell.git#tag=$pkgver")
sha256sums=('SKIP')

build() {
  arch-meson "$_pkgname" build -D gtk_doc=true
  ninja -C build
}

package() {
  DESTDIR="$pkgdir" meson install -C build
}
