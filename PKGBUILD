# Maintainer: Simon Gardling <titaniumtown@gmail.com>

pkgname=gnome-shell-git
_pkgname=gnome-shell
pkgver=3.37.1+80+g71b3b03b2
pkgrel=1
epoch=1
pkgdesc="Next generation desktop shell"
url="https://gitlab.gnome.org/GNOME/gnome-shell"
arch=(x86_64)
license=(GPL2)
depends=(accountsservice gcr gjs-git js68 gnome-bluetooth upower gnome-session gnome-settings-daemon sysprof-git
         gnome-themes-extra gsettings-desktop-schemas-git gtk4 libcanberra-pulse libcroco libgdm libsecret
         mutter-git nm-connection-editor unzip gstreamer libibus gnome-desktop-git bash-completion gnome-autoar)
makedepends=(gtk-doc gnome-control-center evolution-data-server gobject-introspection git meson
             sassc asciidoc)
optdepends=('gnome-control-center: System settings'
            'evolution-data-server: Evolution calendar integration')
groups=(gnome)
provides=(gnome-shell)
conflicts=(gnome-shell)
source=("git+https://gitlab.gnome.org/GNOME/gnome-shell.git")
sha256sums=('SKIP')

pkgver() {
  cd $_pkgname
  git describe --tags | sed 's/-/+/g'
}

build() {
  arch-meson "$_pkgname" build -D gtk_doc=true
  ninja -C build
}

package() {
  DESTDIR="$pkgdir" meson install -C build
}
