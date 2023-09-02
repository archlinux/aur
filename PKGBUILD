# Maintainer: begin-theadventure <begin-thecontact.ncncb at dralias dot com>
# Contributor: Igor Dyatlov <dyatlov.igor@protonmail.com>

_pkgname=upscaler
pkgname=$_pkgname-git
pkgver=1.1.2
pkgrel=2
pkgdesc="Upscale and enhance images (latest commit)"
arch=('x86_64')
url="https://gitlab.gnome.org/World/Upscaler"
license=('GPL3')
depends=('libadwaita' 'python-cffi' 'python-gobject' 'python-vulkan' 'realesrgan-ncnn-vulkan')
makedepends=('blueprint-compiler' 'git' 'meson')
checkdepends=('appstream-glib')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=(git+$url.git)
sha256sums=('SKIP')

pkgver() {
  cd Upscaler
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

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
