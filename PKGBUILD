# Maintainer: quietvoid <tcChlisop0@gmail.com>

pkgname=wahoomc
pkgver=4.3.0
pkgrel=3
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
    '5b48b5a955c6c901dd869844b4b7b8458c5fc1117243e73f3610de81d040dcd6c7720aea6fb0ff2267706ab1258bc756aea5597b19bd332c389d88520fe70baf'
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
