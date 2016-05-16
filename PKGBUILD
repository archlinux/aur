# Maintainer: Alexander F Rødseth <xyproto@archlinux.org>
# Contributor: mosra <mosra@centrum.cz>

pkgname=magnum-plugins
pkgver=2016.05.13
pkgrel=3
pkgdesc='Plugins for the Magnum graphics engine'
arch=('x86_64' 'i686')
url='http://mosra.cz/blog/magnum.php'
license=('MIT')
depends=('magnum' 'libpng' 'libjpeg' 'freetype2')
makedepends=('cmake' 'git' 'ninja')
source=("git://github.com/mosra/magnum-plugins.git#commit=3a1d621")
sha1sums=('SKIP')

build() {
  mkdir -p build
  cd build

  cmake ../magnum-plugins \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DWITH_ANYAUDIOIMPORTER=ON \
    -DWITH_ANYIMAGECONVERTER=ON \
    -DWITH_ANYIMAGEIMPORTER=ON \
    -DWITH_ANYSCENEIMPORTER=ON \
    -DWITH_DDSIMPORTER=ON \
    -DWITH_FREETYPEFONT=ON \
    -DWITH_JPEGIMPORTER=ON \
    -DWITH_MINIEXRIMAGECONVERTER=ON \
    -DWITH_PNGIMPORTER=ON \
    -DWITH_OPENGEXIMPORTER=ON \
    -DWITH_STANFORDIMPORTER=ON \
    -DWITH_STBIMAGEIMPORTER=ON \
    -DWITH_STBPNGIMAGECONVERTER=ON \
    -DWITH_STBVORBISAUDIOIMPORTER=ON \
    -GNinja
  ninja
}

package() {
  DESTDIR="$pkgdir" ninja -C build install
  install -Dm644 "magnum-plugins/COPYING" \
    "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}

# vim:set ts=2 sw=2 et:
