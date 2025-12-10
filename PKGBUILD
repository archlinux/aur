# Maintainer: quietvoid <tcChlisop0@gmail.com>

pkgname=pyhgtmap
pkgver=4.0
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
source=(
  "${_outname}::git+https://github.com/agrenott/pyhgtmap.git#tag=v${pkgver}"
  '0001-Switch-to-ClassRegistry-v5.patch'
)
b2sums=(
  'SKIP'
  'bba5103165f09116b49279988b2dc73878ab37c93f960ea10c77e5f26122e63228bc5909f351e0601ee168b3f179a714041bc42e93934f636ecf50361b8b58e5'
)

prepare() {
  cd "${_outname}"
  patch -Np1 -i "${srcdir}/0001-Switch-to-ClassRegistry-v5.patch"
}

build() {
  cd "${_outname}"
  python -m build --wheel
}

package() {
  cd "${_outname}"
  python -m installer --destdir="$pkgdir" dist/*.whl

  install -Dm644 LICENSE.md "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
