# Maintainer: begin-theadventure <begin-thecontact.ncncb at dralias dot com>

pkgname=curtail-git
pkgdesc='Simple & useful image compressor (latest commit)'
pkgver=1.8.0.r6.gc67c19c
pkgrel=1
arch=('x86_64' 'aarch64')
url="https://github.com/Huluti/Curtail"
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
