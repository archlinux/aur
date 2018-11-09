# Maintainer: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: lorim <lorimz@gmail.com>

pkgname=libtiff4
pkgver=3.9.7
pkgrel=2
pkgdesc='Library for manipulation of TIFF images'
arch=('x86_64')
url='http://www.remotesensing.org/libtiff/'
license=('custom')
depends=('gcc-libs' 'glibc' 'libjpeg-turbo' 'zlib')
source=("http://download.osgeo.org/libtiff/tiff-${pkgver}.tar.gz")
sha256sums=('f5d64dd4ce61c55f5e9f6dc3920fbe5a41e02c2e607da7117a35eb5c320cef6a')

build() {
  cd tiff-${pkgver}

  ./configure \
    --prefix='/usr'
  make
}

package() {
  cd tiff-${pkgver}

  make DESTDIR="${pkgdir}" install
  rm -rf "${pkgdir}"/usr/{bin,include,lib/libtiff{,xx}.{so,a},share}
  mv "${pkgdir}"/usr/lib/libtiff.so.{3,4}
  mv "${pkgdir}"/usr/lib/libtiffxx.so.{3,4}

  install -Dm 644 COPYRIGHT -t "${pkgdir}"/usr/share/licenses/libtiff4/
}

# vim: ts=2 sw=2 et:
