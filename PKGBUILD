# Maintainer: jose <jose1711 [at] gmail (dot) com>
# Contributor: eniac
# Contributor: sabitmaulanaa
# Contributor: tdehaeze

pkgname=cropgui
arch=('any')
pkgver=0.6
pkgrel=2
pkgdesc="a simple tool for lossless jpeg cropping"
license=('GPL')
url="https://github.com/jepler/cropgui"
depends=('libjpeg' 'python-pillow' 'imagemagick' 'python-gobject' 'gtk3' 'perl-image-exiftool')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/jepler/cropgui/archive/v${pkgver}.tar.gz"
        "get_workarea.patch"
        https://patch-diff.githubusercontent.com/raw/jepler/cropgui/pull/104.patch)

md5sums=('337ba42c302793620b68085f88a28498'
         'b66833e4af9b8988ce186f7ea419da25'
         'ec75e93862b019fd7d903454f1930ce9')

prepare() {
  cd $srcdir/$pkgname-$pkgver
  patch -p0 -i "${srcdir}/get_workarea.patch"
  patch -p1 -i "${srcdir}/104.patch"
}

package() {
  cd $srcdir/$pkgname-$pkgver
  ./install.sh -f gtk -t $pkgdir -p /usr -P /usr/bin/python
}
