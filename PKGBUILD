# Maintainer: begin-theadventure <begin-thecontact.ncncb at dralias dot com>

_pkgname=curtail
pkgname=$_pkgname-git
pkgdesc="Simple & lossless image compressor"
pkgver=1.7.0+11+gab0e268
pkgrel=1
arch=('any')
url="https://github.com/Huluti/Curtail"
license=('GPL3')
depends=('jpegoptim' 'libadwaita' 'libwebp' 'optipng' 'pngquant' 'python-gobject')
makedepends=('git' 'meson')
checkdepends=('appstream-glib')
conflicts=($_pkgname imcompressor)
provides=($_pkgname)
source=("git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd Curtail
  git describe --tags | sed 's/-/+/g'
}

build() {
  arch-meson Curtail build
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs
}

package() {
  DESTDIR="$pkgdir" meson install -C build
  install -Dm644 Curtail/README.md -t "$pkgdir/usr/share/doc/$_pkgname"
  install -Dm644 Curtail/COPYING -t "$pkgdir/usr/share/licenses/$_pkgname"
}
