# Maintainer: quietvoid <tcChlisop0@gmail.com>

pkgname=wahoomc
pkgver=4.3.0
pkgrel=4
pkgdesc='wahooMapsCreator - Create maps for Wahoo device based on latest OSM maps'
_outname="${pkgname}-${pkgver}"
_rootdir="wahooMapsCreator-${pkgver}"
arch=('x86_64')
url='https://github.com/treee111/wahooMapsCreator'
license=('MIT')
depends=('gdal' 'osmosis' 'osmium-tool' 'python-gdal' 'python-geojson' 'python-shapely' 'pyhgtmap')
makedepends=('python-build' 'python-installer' 'python-wheel')
optdepends=('phyghtmap')
provides=('wahoomc')
conflicts=('wahoomc')
source=(
    "${_outname}.tar.gz::https://github.com/treee111/wahooMapsCreator/archive/refs/tags/v${pkgver}.tar.gz"
    '0001-Support-pyhgtmap-v4.patch'
)
b2sums=(
    '73db00a88784c1f8d04e1d38a9ab7c408e551a0263c2295efe40a05e37626953439d25374e701fda4db5abac6035194aebe1ca3789f281a6547d30dbc049fc48'
    'badd8e08afb36d084379c1dc62e7dfb3b14e0d8072add727130b1f39223878a249660c07420390a83e7d7e8d5d9cf15566a03c32f31415981d2ade3048c4d195'
)

prepare() {
  cd "${_rootdir}"
  patch -Np1 -i "${srcdir}/0001-Support-pyhgtmap-v4.patch"
}

build() {
    cd "${_rootdir}"
    python -m build --wheel
}

package() {
    cd "${_rootdir}"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
