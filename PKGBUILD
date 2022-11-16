# Maintainer: Igor Dyatlov <dyatlov.igor@protonmail.com>

pkgname=upscaler-git
pkgver=1.0.0.r0.g712c262
pkgrel=1
pkgdesc="Upscale and enhance images"
arch=('x86_64')
url="https://gitlab.com/TheEvilSkeleton/Upscaler"
license=('GPL3')
depends=('libadwaita' 'python-gobject' 'realesrgan-ncnn-vulkan')
makedepends=('git' 'blueprint-compiler' 'meson')
checkdepends=('appstream-glib')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=(${pkgname%-git}::git+$url.git)
b2sums=('SKIP')

pkgver() {
  cd "${pkgname%-git}"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  arch-meson "${pkgname%-git}" build
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs || :
}

package() {
  meson install -C build --destdir "$pkgdir"
}
