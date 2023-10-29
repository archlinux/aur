# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix
# Contributor: Igor Dyatlov <dyatlov.igor@protonmail.com>

pkgname=upscaler
pkgver=1.2.2
pkgrel=1
pkgdesc="Upscale and enhance images"
arch=(any)
url="https://gitlab.gnome.org/World/Upscaler"
license=(GPL3)
depends=(libadwaita python-cffi python-gobject python-vulkan realesrgan-ncnn-vulkan python gtk4 pango gobject-introspection-runtime)
makedepends=(git blueprint-compiler meson)
checkdepends=(appstream-glib)
source=("git+https://gitlab.gnome.org/World/Upscaler.git#tag=${pkgver}")
b2sums=('SKIP')

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
