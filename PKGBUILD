# Maintainer: Jan Niklas Böhm <mail@jnboehm.com>
# Contributer: Caltlgin Stsodaat <contact@fossdaily.xyz>
# Contributer: Eli Patterson <elipup@gmail.com>
# Contributer: Franz Müller <ethylisocyanat@gmail.com>

_pkgname='osmnx'
pkgname="python-${_pkgname}"
pkgver=2.0.0
pkgrel=1
pkgdesc='Retrieve, model, analyze, and visualize OpenStreetMap street networks and other spatial data'
arch=('any')
url='https://github.com/gboeing/osmnx'
_url_pypi='https://pypi.org/project/osmnx'
license=('MIT')
depends=(
    'python-geopandas'
    'python-networkx'
    'python-numpy'
    'python-pandas'
    'python-requests'
    'python-shapely'
)
optdepends=(
    'python-matplotlib: for visualization'
    'python-scipy: for entropy'
    'python-scikit-learn: for neighbors'
    'python-gdal: for rasterization'
    'python-rasterio: for rasterization'
)
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-hatchling')
source=("https://files.pythonhosted.org/packages/source/${_pkgname::1}/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('4fd2eb3736cea503be94ab18d31a669addbaf2dd6a8249527cef94163bb93975')

build() {
  cd "${_pkgname}-${pkgver}"
  python -m build --wheel --no-isolation
}

package() {
  cd "${_pkgname}-${pkgver}"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dvm644 'README.md' -t "${pkgdir}/usr/share/doc/${pkgname}"
  install -Dvm644 'LICENSE.txt' "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim: ts=2 sw=2 et:
