# Maintainer: jerry73204 <jerry73204 at gmail dot com>
pkgname=ogr2osm-git
pkgver=r152.183e226
pkgrel=1
pkgdesc='A tool for converting ogr-readable files like shapefiles into .osm data'
arch=('any')
url='https://github.com/pnorman/ogr2osm'
license=('MIT')
depends=('python' 'python-gdal')
makedepends=('git' 'python-setuptools')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=(
  'ogr2osm::git+https://github.com/pnorman/ogr2osm.git'
  'setup.py'
)
sha256sums=('SKIP'
            '18049525bdc1d0c99d2863ac1d88b149e7dc9d4f2c521ff2e523c04bdc5f3961')

pkgver() {
  cd "$srcdir/${pkgname%-git}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "$srcdir/${pkgname%-git}"
  cp ${srcdir}/setup.py setup.py
}

build() {
  cd "$srcdir/${pkgname%-git}"
  python3 setup.py build
}

package() {
  cd "$srcdir/${pkgname%-git}"
  python3 setup.py install --root=${pkgdir} --prefix=/usr --optimize=1
}
