# Maintainer: Sylvain POULAIN <sylvain.poulain at giscan dot com>
pkgname=python-py-tools-ds
_pkgname=py_tools_ds
pkgver=0.24.1
pkgrel=1
pkgdesc="A collection of geospatial data analysis tools that simplify standard operations when handling geospatial raster and vector data as well as projections."
arch=('any')
url="https://git.gfz-potsdam.de/danschef/$_pkgname"
license=('Apache 2.0')
depends=('python' 'python-gdal' 'python-numpy' 'python-pandas' 'python-pyproj' 'python-shapely' 'python-spectral')
makedepends=('git' 'python-setuptools')
source=("$_pkgname-$pkgver::$url/-/archive/v$pkgver/$_pkgname-v$pkgver.tar.gz")
sha256sums=('7ccfcef3c2bccfc92e9aa4d1d25ebb0777ea4f4f7ce96675221619d94486bc59')

build() {
  cd "$srcdir/$_pkgname-v$pkgver"
  python -m build --wheel --skip-dependency-check --no-isolation
}

package() {
  cd "$srcdir/$_pkgname-v$pkgver"
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="${pkgdir}" dist/*.whl

  install -Dm 644 README.rst -t "${pkgdir}/usr/share/doc/${_pkgname}"
  # rm -r "${pkgdir}"/usr/lib/python3.14/site-packages/doc/source/conf.py
  # rm -r "${pkgdir}${site_packages}/${_base}"/tests/
  # mv "${pkgdir}/usr/etc" "${pkgdir}/etc"
}
