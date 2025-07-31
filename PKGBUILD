# Maintainer: Sylvain POULAIN <sylvain.poulain at giscan dot com>
pkgname=python-pysfcgal
_pkgname=pysfcgal
pkgver=2.2.0
pkgrel=1
pkgdesc="A Python package for segmenting geospatial data with the Segment Anything Model (SAM)"
arch=('any')
url="https://gitlab.com/sfcgal/pysfcgal"
license=('MIT')
depends=('python' 'sfcgal')
makedepends=('git' 'python-setuptools')
source=("$_pkgname-$pkgver.tar.gz::$url/-/archive/v$pkgver/$_pkgname-v$pkgver.tar.gz")
sha256sums=('b6bc1ec00d4b946fcf78c85bce111595a0a7ae6b5e463b973c20d566d747ea83')

build() {
  cd "$srcdir/$_pkgname-v$pkgver"
  python -m build --wheel --skip-dependency-check --no-isolation
}

package() {
  cd "$srcdir/$_pkgname-v$pkgver"
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="${pkgdir}" dist/*.whl

  install -Dm 644 README.md -t "${pkgdir}/usr/share/doc/${_pkgname}"
  # rm -r "${pkgdir}${site_packages}/${_base}"/tests/
  # mv "${pkgdir}/usr/etc" "${pkgdir}/etc"
}
