# Maintainer: Sylvain POULAIN <sylvain.poulain at giscan dot com>
pkgname=python-pdal
pkgver=3.4.5
pkgrel=1
pkgdesc="Python extension for PDAL (Point Data Abstraction Library)"
arch=('any')
url="https://github.com/PDAL/python"
license=('BSD')
depends=('pdal' 'python')
makedepends=('git' 'python-setuptools')
source=("$pkgname-$pkgver.tar.gz::https://github.com/PDAL/python/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('b264ccd29d349ae2b911cafda8aae4ecafe464a1a62f6c02ad3bf038f660154d')

build() {
  cd "$srcdir/python-$pkgver"
  mv setup.py.off setup.py
  python -m build --wheel --skip-dependency-check --no-isolation
}

package() {
  cd "$srcdir/python-$pkgver"
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="${pkgdir}" dist/*.whl

  install -Dm 644 README.rst -t "${pkgdir}/usr/share/doc/${pkgname}"
  # rm -r "${pkgdir}${site_packages}/${_base}"/tests/
  # mv "${pkgdir}/usr/etc" "${pkgdir}/etc"
}
