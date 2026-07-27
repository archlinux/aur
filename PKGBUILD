# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix
# Contributor: Igor Dyatlov <dyatlov.igor@protonmail.com>

pkgname=upscaler
pkgver=1.6.4
pkgrel=1
pkgdesc="Upscale and enhance images"
arch=(any)
url="https://gitlab.gnome.org/World/Upscaler"
license=(GPL-3.0-only)
depends=(libadwaita python-gobject python-pillow python-vulkan upscayl-ncnn python gtk4 pango glib2)
makedepends=(git blueprint-compiler meson)
checkdepends=(appstream-glib)
source=("git+https://gitlab.gnome.org/World/Upscaler.git#tag=${pkgver}")
b2sums=('cd17809de4563cd8ae44cd677580b269e8c59165ff6522a8023aa1d3ec72b57c4e67a49be6607888fcf84686382e21e9fbf23dedd38b0e65640710e075f6c82c')

build() {
  arch-meson Upscaler build
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs || :
}

package() {
  meson install -C build --destdir "$pkgdir"
}
