# Maintainer: Sylvain POULAIN <sylvain.poulain at giscan dot com>
pkgname=python-pyodm
_pkgname=PyODM
pkgver=1.5.12
pkgrel=1
pkgdesc="A Python SDK for adding aerial image processing capabilities to your applications. NodeODM"
arch=('any')
url="https://github.com/OpenDroneMap/PyODM"
license=('BSD')
depends=('python-requests' 'python-requests-toolbelt' 'python-urllib3')
makedepends=('git' 'python-setuptools')
source=("$_pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('3c82461c63ee9e9f0ea9c2e8ee8c0e90b7d21e47172c1b935372b68a42125f97')

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
