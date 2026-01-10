# Maintainer: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: lorim <lorimz@gmail.com>

pkgname=lib32-libtiff4
pkgver=4.7.1
pkgrel=1
pkgdesc='Library for manipulation of TIFF images'
arch=(x86_64)
url=http://www.simplesystems.org/libtiff/
license=(custom)
depends=(
  lib32-gcc-libs
  lib32-glibc
  lib32-libjpeg-turbo
  lib32-zlib
)
makedepends=(git)
source=(https://download.osgeo.org/libtiff/tiff-4.7.1.tar.gz)
sha256sums=('f698d94f3103da8ca7438d84e0344e453fe0ba3b7486e04c5bf7a9a3fabe9b69')

prepare() {
  cd tiff-"${pkgver}"

  ./autogen.sh
}

build() {
  cd tiff-"${pkgver}"

  export CC='gcc -m32'
  export CXX='g++ -m32'
  export PKG_CONFIG_PATH=/usr/lib32/pkgconfig

  ./configure \
    --prefix='/usr' \
    --libdir='/usr/lib32'
  make
}

package() {
  make DESTDIR="${pkgdir}" -C tiff-"${pkgver}" install
  rm -rf "${pkgdir}"/usr/{bin,include,lib32/libtiff{,xx}.{a,so},share}
  install -dm 755 "${pkgdir}"/usr/share/licenses
  ln -s libtiff4 "${pkgdir}"/usr/share/licenses/lib32-libtiff4
}

# vim: ts=2 sw=2 et:
