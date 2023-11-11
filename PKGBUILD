# Maintainer: tfuxu <tfuxu@tutanota.com>
pkgname=halftone
pkgver=0.4.0
pkgrel=1
pkgdesc="Give your images that pixel art-like style"
arch=('any')
url="https://github.com/tfuxu/Halftone"
license=('GPL3')
depends=(
    'gtk4'
    'libadwaita'
    'imagemagick'
    'python'
    'python-gobject'
    'python-wand')
optdepends=(
    'webp-pixbuf-loader: support more image formats')
checkdepends=('appstream-glib')
makedepends=('git' 'meson' 'ninja' 'blueprint-compiler')
#source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz")
_commit=bb90b82a2032fde17d897edfa58386025af6cca6 # tags/0.4.0
source=("git+$url.git#commit=$_commit")
sha256sums=('SKIP')

prepare() {
  cd Halftone
}

build() {
  arch-meson Halftone build
  ninja -C build
}

package() {
  DESTDIR="$pkgdir" meson install -C build
  install -Dm644 Halftone/README.md -t "$pkgdir/usr/share/doc/$pkgname"
  install -Dm644 Halftone/COPYING -t "$pkgdir/usr/share/licenses/$pkgname"
}
