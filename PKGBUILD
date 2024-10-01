# Maintainer: Sylvain POULAIN <sylvain.poulain at giscan dot com>
pkgname=python-geodatasets
_pkgname=geodatasets
pkgver=2024.8.0
pkgrel=1
pkgdesc="Python geopandas spatial data examples "
arch=('any')
url="https://github.com/geopandas/geodatasets"
license=('BSD-3')
depends=('python' 'python-geopandas')
makedepends=('git' 'python-setuptools')
source=("$pkgname-$pkgver.tar.gz::$url/releases/download/$pkgver/$_pkgname-$pkgver.tar.gz")
sha256sums=('ea1b0f885f1b3305d4a308b2ddee042e425c5288b5ff6b00e6b0ac74a4d5e8d9')

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
