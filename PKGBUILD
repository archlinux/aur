# Maintainer: begin-theadventure <begin-thecontact.ncncb at dralias dot com>

pkgname=curtail-git
pkgver=1.10.0.r2.ge6900c9
pkgrel=1
pkgdesc='Simple & useful image compressor (latest commit)'
url="https://github.com/Huluti/Curtail"
license=('GPL-3.0-or-later')
arch=('x86_64' 'aarch64')
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
