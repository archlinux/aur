# Maintainer: quietvoid <tcChlisop0@gmail.com>

pkgname=wahoomc
pkgver=4.4.0
pkgrel=1
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
b2sums=('ce2c1e821c6535c152527c919c2fa07be1cbcdb3b8033a2c963b299da41ecd7d6aacdc3f39ba471d6ec8e7d9cbc94e2ac655b7d6e0ee3874aae3aafb70df5127'
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
