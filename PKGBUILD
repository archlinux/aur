# Maintainer: Ignacy Kuchciński (ignapk) <ignacykuchcinski@gmail.com>
# Contributor: Simon Gardling <titaniumtown@gmail.com>
# Contributor: Ricardo Liang (rliang) <ricardoliang@gmail.com>

pkgname=gnome-shell-git
_pkgname=gnome-shell
pkgver=40.beta+89+gb85331649
pkgrel=1
epoch=1
pkgdesc="Next generation desktop shell"
url="https://gitlab.gnome.org/GNOME/gnome-shell"
arch=(x86_64)
license=(GPL2)
depends=(accountsservice gcr gjs gnome-bluetooth upower gnome-session
         gnome-settings-daemon gnome-themes-extra gsettings-desktop-schemas
         libcanberra-pulse libgdm libsecret mutter-git nm-connection-editor unzip
         gstreamer libibus gnome-autoar gnome-disk-utility gst-plugin-pipewire
         gtk4 libgweather-git)
makedepends=(gtk-doc gnome-control-center evolution-data-server gobject-introspection git meson
             sassc asciidoc bash-completion vulkan-headers)
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
