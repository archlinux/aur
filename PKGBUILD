# Contributor: cqzw555 <cqzw555@163.com>
# Contributor: Carlos Aznarán Laos <caznaranl@uni.pe>
# Contributor: Christian Hesse <mail@eworm.de>
# Contributor: Anatol Pomozov <anatol.pomozov@gmail.com>

_base=pykickstart
pkgbase=python-${_base}
pkgname=(python-${_base} ${_base}-tools)
pkgver=3.53
pkgrel=1
pkgdesc="Python module for manipulating kickstart files"
arch=(any)
license=(GPL-2.0-only)
url="http://fedoraproject.org/wiki/Pykickstart"
depends=(python-requests)
makedepends=(python-build python-installer python-setuptools python-wheel)
source=("${_base}-${pkgver}.tar.gz::https://github.com/${_base}/${_base}/archive/r${pkgver}.tar.gz")
sha512sums=('a28941e4a4c1d1bbea5b0f36f52f8fc2bb0bec66b9a1a709bc520de73378caeb69c012e3f504f510adb0bcd8f6495bfbb9f70939e968628f81c17ea79b8cfae9')

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
