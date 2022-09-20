# Maintainer: Pellegrino Prevete (tallero) <pellegrinoprevete@gmail.com>
# Contributor: Ignacy Kuchciński (ignapk) <ignacykuchcinski@gmail.com>
# Contributor: Simon Gardling <titaniumtown@gmail.com>
# Contributor: Ricardo Liang (rliang) <ricardoliang@gmail.com>

# shellcheck disable=SC2034
_pkgname="gnome-shell"
pkgname="${_pkgname}-git"
pkgver=43.0+17+g901661487
pkgrel=1
epoch=1
pkgdesc="Next generation desktop shell"
url="https://gitlab.gnome.org/GNOME/${_pkgname}"
arch=('x86_64' 'i686' 'pentium4')
license=(GPL)
depends=(accountsservice gcr-git gjs-git gnome-bluetooth upower gnome-session gtk4
         gnome-settings-daemon gsettings-desktop-schemas-git libcanberra-pulse
         libgdm libsecret mutter-git nm-connection-editor unzip gstreamer libibus
         gnome-autoar gnome-disk-utility gst-plugin-pipewire libsoup3-git libgweather-git)
makedepends=(gtk-doc gnome-control-center evolution-data-server-git
             gobject-introspection git meson sassc asciidoc bash-completion
             vulkan-headers)
optdepends=('gnome-control-center: System settings'
            'evolution-data-server: Evolution calendar integration')
groups=(gnome)
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("git+https://gitlab.gnome.org/GNOME/${_pkgname}.git")
sha256sums=('SKIP')

pkgver() {
  cd "${_pkgname}" || exit
  git describe --tags | sed 's/-/+/g'
}

build() {
  arch-meson "$_pkgname" build -D gtk_doc=true
  meson compile -C build
}

# shellcheck disable=SC2154
package() {
  DESTDIR="$pkgdir" meson install -C build
}
