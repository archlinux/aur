# Maintainer: Sylvain POULAIN <sylvain.poulain at giscan dot com>
pkgname=python-geoarray
_pkgname=geoarray
pkgver=0.19.2
pkgrel=1
pkgdesc="A fast Python interface for image geodata - either on disk or in memory."
arch=('any')
url="https://git.gfz-potsdam.de/danschef/geoarray"
license=('Apache 2.0')
depends=('python' 'python-cartopy' 'python-gdal' 'python-matplotlib' 'python-numpy' 'python-pandas' 'python-py-tools-ds' 'python-shapely' 'python-scikit-image')
makedepends=('git' 'python-setuptools')
source=("$_pkgname-$pkgver::$url/-/archive/v$pkgver/$_pkgname-v$pkgver.tar.gz")
sha256sums=('ce2bdf315ecfb572b86ae6e8016e6530a866a946f6e08f0e4ef2f0d09568ef3b')

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
