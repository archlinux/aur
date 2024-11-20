# Maintainer: Sylvain POULAIN <sylvain.poulain at giscan dot com>
pkgname=python-geojson-rewind
_pkgname=geojson-rewind
pkgver=1.1.0
pkgrel=1
pkgdesc="🌍 A Python library for enforcing polygon ring winding order in GeoJSON"
arch=('any')
url="https://github.com/chris48s/$_pkgname"
license=('MIT')
depends=('python-geojson')
makedepends=('git' 'python-setuptools' 'python-poetry')
source=("$_pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('1058d1ab0d35ce4231d87a773b777ee7b817817ed21a33c69c686447043f2a0f')

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
