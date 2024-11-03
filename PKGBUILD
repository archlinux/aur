# Maintainer: Sylvain POULAIN <sylvain.poulain at giscan dot com>
pkgname=python-pycsw
_pkgname=pycsw
pkgver=2.6.1
pkgrel=1
pkgdesc="pycsw is an OGC API - Records and CSW server implementation written in Python."
arch=('any')
url="https://github.com/geopython/pycsw"
license=('MIT')
depends=('python-click' 'python-geolinks' 'python-lxml' 'python-owslib' 'python-pyproj' 'python-dateutil' 'python-pyaml' 'python-shapely' 'python-xmltodict')
makedepends=('git' 'python-setuptools')
source=("$_pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('bf00b6d62d1781f85980ff60d522fb4782f3938a60df6720347354e7b4604fb7')

build() {
  cd "$srcdir/$_pkgname-$pkgver"
  python -m build --wheel --skip-dependency-check --no-isolation
}

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="${pkgdir}" dist/*.whl

  install -Dm 644 README.rst -t "${pkgdir}/usr/share/doc/${_pkgname}"
  # rm -r "${pkgdir}${site_packages}/${_base}"/tests/
  # mv "${pkgdir}/usr/etc" "${pkgdir}/etc"
}
