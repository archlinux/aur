# Maintainer: Sylvain POULAIN <sylvain dot poulain at giscan dot com>
# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Contributor: Eric Bélanger <eric@archlinux.org>

pkgname=libtiff-lerc
pkgver=4.4.0
pkgrel=1
pkgdesc='Library for manipulation of TIFF images'
url='http://www.simplesystems.org/libtiff/'
arch=('x86_64')
license=('custom')
depends=('glibc' 'libjpeg' 'libjpeg.so' 'zlib' 'xz' 'zstd' 'lerc')
makedepends=('freeglut' 'glu' 'mesa' 'jbigkit')
optdepends=('freeglut: for using tiffgt')
provides=('libtiff=4.3.0' 'libtiff.so' 'libtiffxx.so')
conflicts=('libtiff')
source=(https://download.osgeo.org/libtiff/tiff-${pkgver}.tar.gz)
sha256sums=('917223b37538959aca3b790d2d73aa6e626b688e02dcda272aec24c2f498abed')

build() {
  cd tiff-${pkgver}
  ./configure \
    --prefix=/usr \
	  --sysconfdir=/etc \
	  --mandir=/usr/share/man \
    --with-docdir=/usr/share/doc/${pkgname}
  sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool
  make
}

check() {
  cd tiff-${pkgver}
  make check
}

package() {
  cd tiff-${pkgver}
  make DESTDIR="${pkgdir}" install
  install -Dm 644 COPYRIGHT -t "${pkgdir}/usr/share/licenses/${pkgname}"
}

# vim: ts=2 sw=2 et:
