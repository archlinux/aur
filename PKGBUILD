# Maintainer: begin-theadventure <begin-thecontact.ncncb at dralias dot com>

_pkgname=curtail
pkgname=$_pkgname-git
pkgdesc='Simple & useful image compressor (latest commit)'
pkgver=1.7.0
pkgrel=2
arch=('any')
url="https://github.com/Huluti/Curtail"
license=('GPL3')
depends=('jpegoptim' 'libadwaita' 'libwebp' 'optipng' 'pngquant' 'python-gobject')
makedepends=('git' 'meson')
checkdepends=('appstream-glib')
provides=($_pkgname)
conflicts=($_pkgname imcompressor)
source=("git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd Curtail
  git describe --long --tags | sed 's/\([^-]*-g\)/\1/;s/-/./g'
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
