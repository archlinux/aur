# Maintainer: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: lorim <lorimz@gmail.com>

pkgname=lib32-libtiff4
pkgver=3.9.7
pkgrel=1
pkgdesc='Library for manipulation of TIFF images'
arch=('x86_64')
url='http://www.remotesensing.org/libtiff/'
license=('custom')
depends=('lib32-gcc-libs' 'lib32-glibc' 'lib32-libjpeg-turbo' 'lib32-zlib')
makedepends=('gcc-multilib')
source=("http://download.osgeo.org/libtiff/tiff-${pkgver}.tar.gz")
sha256sums=('f5d64dd4ce61c55f5e9f6dc3920fbe5a41e02c2e607da7117a35eb5c320cef6a')

build() {
  cd tiff-${pkgver}

  export CC='gcc -m32'
  export CXX='g++ -m32'
  export PKG_CONFIG_PATH='/usr/lib32/pkgconfig'

  ./configure \
    --prefix='/usr' \
    --libdir='/usr/lib32'
  make
}

package() {
  cd tiff-${pkgver}

  make DESTDIR="${pkgdir}" install
  rm -rf "${pkgdir}"/usr/{bin,include,lib32/libtiff{,xx}.{so,a},share}
  mv "${pkgdir}"/usr/lib32/libtiff.so.{3,4}
  mv "${pkgdir}"/usr/lib32/libtiffxx.so.{3,4}

  install -dm 755 "${pkgdir}"/usr/share/licenses
  ln -s libtiff4 "${pkgdir}"/usr/share/licenses/lib32-libtiff4
}

# vim: ts=2 sw=2 et:
