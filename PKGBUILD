# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: jerry73204 <jerry73204 at google gmail>
_base=geoviews
pkgname=python-${_base}
pkgver=1.9.5
pkgrel=1
pkgdesc="Simple, concise geographical visualization in Python"
arch=(any)
url="https://github.com/pyviz/${_base}"
license=('custom:BSD-3-clause')
depends=(python-bokeh python-cartopy python-holoviews python-packaging python-xarray)
makedepends=(nodejs)
# optdepends=('python-datashader: for '
#   'python-geopandas: for '
#   'python-osgeo: for ' # gdal
#   'jupyter-notebook: for '
#   'python-matplotlib: for '
# )
checkdepends=(python-pytest) # python-nbsmoke
source=(${url}/archive/v${pkgver}.tar.gz)
sha512sums=('8cc4d468b7c043ba9a512c581c093b460f920eec0cb3cd67f2770b714a22f94762044eb2813a4660d3303d6331e3294918cc9f3670d533e3d92a091af380da30')

build() {
  cd ${_base}-${pkgver}
  python setup.py build
}

package_python-geoviews() {
  cd ${_base}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1 --skip-build
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm 644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}"
}
