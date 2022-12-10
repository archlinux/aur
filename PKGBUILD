# Maintainer: Igor Dyatlov <dyatlov.igor@protonmail.com>

pkgname=upscaler
pkgver=1.1.1
pkgrel=1
pkgdesc="Upscale and enhance images"
arch=('x86_64')
url="https://gitlab.com/TheEvilSkeleton/Upscaler"
license=('GPL3')
depends=('libadwaita' 'python-gobject' 'realesrgan-ncnn-vulkan-bin')
makedepends=('git' 'blueprint-compiler' 'meson')
checkdepends=('appstream-glib')
_commit=f236353b65edd3581482a2e69e77be254dddbb34 # tags/1.1.1^0
_source=Upscaler
source=("git+$url.git#commit=$_commit")
b2sums=('SKIP')

pkgver() {
  cd $_source
  git describe --tags | sed 's/[^-]*-g/r&/;s/-/+/g'
}

build() {
  arch-meson $_source build
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs || :
}

package() {
  meson install -C build --destdir "$pkgdir"
}
