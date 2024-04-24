# Maintainer: begin-theadventure <begin-thecontact.ncncb at dralias dot com>

pkgname=curtail-git
pkgver=1.9.1.r11.g424cea7
pkgrel=1
pkgdesc='Simple & useful image compressor (latest commit)'
url="https://github.com/Huluti/Curtail"
arch=('x86_64' 'aarch64')
license=('GPL3')
depends=('jpegoptim' 'libadwaita' 'libwebp' 'oxipng' 'pngquant' 'python-gobject' 'scour')
makedepends=('git' 'meson')
checkdepends=('appstream-glib')
provides=("curtail")
conflicts=("curtail")
source=("git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd Curtail
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  arch-meson Curtail build
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs
}

package() {
  meson install -C build --destdir "$pkgdir"
}
