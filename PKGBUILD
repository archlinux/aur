# Contributor: cqzw555 <cqzw555@163.com>
# Contributor: Carlos Aznarán Laos <caznaranl@uni.pe>
# Contributor: Christian Hesse <mail@eworm.de>
# Contributor: Anatol Pomozov <anatol.pomozov@gmail.com>

_base=pykickstart
pkgbase=python-${_base}
pkgname=(python-${_base} ${_base}-tools)
pkgver=3.54
pkgrel=1
pkgdesc="Python module for manipulating kickstart files"
arch=(any)
license=(GPL-2.0-only)
url="http://fedoraproject.org/wiki/Pykickstart"
depends=(python-requests)
makedepends=(python-build python-installer python-setuptools python-wheel)
source=("${_base}-${pkgver}.tar.gz::https://github.com/${_base}/${_base}/archive/r${pkgver}.tar.gz")
sha512sums=('d2f272a3189369d47c051cf4e07c7fe9bf7ace282939530c6e0288cc10a0c459b850d44e71422eaa1333466c765cede3381785b53fe46e5a83abd7a941dd880d')

build() {
  cd ${_base}-r${pkgver}
  python -m build --wheel --skip-dependency-check --no-isolation
}

package_python-pykickstart() {
  pkgdesc="Python module for manipulating kickstart files"
  depends=(python-requests)

  cd ${_base}-r${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="${pkgdir}" dist/*.whl

  # this is distributed with tools package
  rm -r "${pkgdir}"/usr/{bin,share}
}

package_pykickstart-tools() {
  pkgdesc="tools for reading and writing kickstart files"
  depends=(python-pykickstart)

  cd ${_base}-r${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="${pkgdir}" dist/*.whl

  # this is distributed with libs package
  rm -rf "${pkgdir}"/usr/lib
}
