# Maintainer: quietvoid <tcChlisop0@gmail.com>

pkgname=pyhgtmap
pkgver=3.9
pkgrel=1
pkgdesc="Fork of official phyghtmap - Generate OSM contour lines from NASA SRTM data"
_outname="${pkgname}-v${pkgver}"
arch=('x86_64')
url="https://github.com/agrenott/pyhgtmap"
license=('GPL2')
depends=(
  'python-beautifulsoup4'
  'python-class-registry'
  'python-colorlog'
  'python-configargparse'
  'python-contourpy'
  'python-httpx'
  'python-matplotlib'
  'python-nptyping'
  'python-numpy'
  'python-npyosmium'
  'python-pybind11-rdp'
  'python-pydrive2'
  'python-scipy'
  'python-shapely'
)
makedepends=('python-build' 'python-installer' 'python-wheel')
optdepends=('gdal' 'python-gdal')
source=("${_outname}::git+https://github.com/agrenott/pyhgtmap.git#tag=v${pkgver}")
sha256sums=('SKIP')

build() {
  cd "${_outname}"
  python -m build --wheel
}

package() {
  cd "${_outname}"
  python -m installer --destdir="$pkgdir" dist/*.whl

  install -Dm644 LICENSE.md "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
