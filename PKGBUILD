# Maintainer: Sylvain POULAIN <sylvain.poulain at giscan dot com>
pkgname=python-morecantile
_pkgname=morecantile
pkgver=6.1.0
pkgrel=1
pkgdesc="Construct and use OGC TileMatrixSets (TMS)"
arch=('any')
url="https://github.com/developmentseed/morecantile"
license=('MIT')
depends=('python-pyproj' 'python-attrs' 'python-pydantic')
makedepends=('git' 'python-setuptools')
source=("$_pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('59e1bdfd79381bab245a9428941104ceee31c09461312ba63cd13a9ddda407bf')

build() {
  cd "$srcdir/$_pkgname-$pkgver"
  python -m build --wheel --skip-dependency-check --no-isolation
}

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="${pkgdir}" dist/*.whl

  install -Dm 644 README.md -t "${pkgdir}/usr/share/doc/${_pkgname}"
  # rm -r "${pkgdir}${site_packages}/${_base}"/tests/
  # mv "${pkgdir}/usr/etc" "${pkgdir}/etc"
}
