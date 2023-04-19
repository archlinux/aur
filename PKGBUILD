# Maintainer: Jose Riha <jose1711 gmail com>
# Contributor: Doug Newgard <scimmia at archlinux dot org>

pkgname=python2-gdal
pkgver=3.0.1
pkgrel=2
pkgdesc='Python2 bindings for GDAL'
arch=('x86_64')
url='https://gdal.org/'
license=('custom')
depends=('gcc-libs' 'gdal' 'glibc' 'python2' 'python2-numpy')
source=("https://download.osgeo.org/gdal/$pkgver/gdal-$pkgver.tar.xz")
sha256sums=('45b4ae25dbd87282d589eca76481c426f72132d7a599556470d5c38263b09266')

build() {
  cd gdal-$pkgver/swig/python
  python2 setup.py build
}

package() {
  cd gdal-$pkgver/swig/python
  python2 setup.py install --root="$pkgdir" --optimize=1
  for bin in "$pkgdir/usr/bin/"*.py; do mv "$bin" "${bin%.py}2.py"; done

  install -dm755 "$pkgdir/usr/share/licenses"
  ln -s gdal "$pkgdir/usr/share/licenses/$pkgname"
}
