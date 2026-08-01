# Maintainer: quietvoid <tcChlisop0@gmail.com>

pkgname=wahoomc
pkgver=4.3.0
pkgrel=6
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
b2sums=('73db00a88784c1f8d04e1d38a9ab7c408e551a0263c2295efe40a05e37626953439d25374e701fda4db5abac6035194aebe1ca3789f281a6547d30dbc049fc48'
        'd0e7580c66d2dea9992ca30f7202c7cd3d151107d218e7592f05e404e04bbc40e9f8001ffb0ef1808a80a5c5c0355c69d892d29e9671979c254723d7af5e3d5f')

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
