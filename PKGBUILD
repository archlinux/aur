# Maintainer: Sylvain POULAIN <sylvain.poulain at giscan dot com>
pkgname=python-arosics
_pkgname=arosics
pkgver=1.13.2
pkgrel=1
pkgdesc="AROSICS - Automated and Robust Open-Source Image Co-Registration Software "
arch=('any')
url="https://github.com/GFZ/arosics"
license=('Apache 2.0')
depends=('python' 'python-cmocean' 'python-folium' 'python-joblib' 'python-cartopy' 'python-gdal' 'python-geojson' 'python-geopandas' 'python-geoarray' 'python-matplotlib' 'python-numpy' 'python-pandas' 'python-pyproj' 'python-shapely' 'python-scipy' 'python-scikit-image')
makedepends=('git' 'python-setuptools')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('8d73290dc8dc49e25e2e2e680342b03f62557f3f9d2e576f300a555f3abbc979')

build() {
  cd "$srcdir/$_pkgname-$pkgver"
  python -m build --wheel --skip-dependency-check --no-isolation
}

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="${pkgdir}" dist/*.whl

  install -Dm 644 README.rst -t "${pkgdir}/usr/share/doc/${_pkgname}"
  # rm -r "${pkgdir}"/usr/lib/python3.14/site-packages/doc/source/conf.py
  # rm -r "${pkgdir}${site_packages}/${_base}"/tests/
  # mv "${pkgdir}/usr/etc" "${pkgdir}/etc"
}
