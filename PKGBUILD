# Maintainer: tfuxu <tfuxu@tutanota.com>
pkgname=halftone
pkgver=0.2.0
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
_commit=150ac2c64454491a80141f97de5cb6f1d65fdb0c # tags/0.2.0
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
