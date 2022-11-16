# Maintainer: Igor Dyatlov <dyatlov.igor@protonmail.com>

pkgname=upscaler
pkgver=1.0.0
pkgrel=1
pkgdesc="Upscale and enhance images"
arch=('x86_64')
url="https://gitlab.com/TheEvilSkeleton/Upscaler"
license=('GPL3')
depends=('libadwaita' 'python-gobject' 'realesrgan-ncnn-vulkan')
makedepends=('git' 'blueprint-compiler' 'meson')
checkdepends=('appstream-glib')
_commit=712c262a3453ea37344424c213362d0234582d60 # tags/1.0.0^0
source=("$pkgname-$pkgver::git+$url.git#commit=$_commit")
b2sums=('SKIP')

pkgver() {
  cd $pkgname-$pkgver
  git describe --tags | sed 's/[^-]*-g/r&/;s/-/+/g'
}

build() {
  arch-meson $pkgname-$pkgver build
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs || :
}

package() {
  meson install -C build --destdir "$pkgdir"
}
