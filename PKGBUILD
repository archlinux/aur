# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix
# Contributor: Igor Dyatlov <dyatlov.igor@protonmail.com>

pkgname=upscaler
pkgver=1.4.0
pkgrel=1
pkgdesc="Upscale and enhance images"
arch=(any)
url="https://gitlab.gnome.org/World/Upscaler"
license=(GPL-3.0-only)
depends=(libadwaita python-cffi python-gobject python-vulkan realesrgan-ncnn-vulkan python gtk4 pango gobject-introspection-runtime)
makedepends=(git blueprint-compiler meson)
checkdepends=(appstream-glib)
source=("git+https://gitlab.gnome.org/World/Upscaler.git#tag=${pkgver}")
b2sums=('5dfe53bf0e8278077a97c1cec68e191b4afc68d7a833917b82f311510a8f4af307ec0da4d2e84c15d0eeb1bd60e5c2f46ed5d2a2eea78618a5fc4ad785129bbc')

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
