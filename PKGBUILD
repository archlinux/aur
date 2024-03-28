# Contributor: cqzw555 <cqzw555@163.com>
# Contributor: Carlos Aznarán Laos <caznaranl@uni.pe>
# Contributor: Christian Hesse <mail@eworm.de>
# Contributor: Anatol Pomozov <anatol.pomozov@gmail.com>

_base=pykickstart
pkgbase=python-${_base}
pkgname=(python-${_base} ${_base}-tools)
pkgver=3.52
pkgrel=1
pkgdesc="Python module for manipulating kickstart files"
arch=(any)
license=(GPL)
url="http://fedoraproject.org/wiki/Pykickstart"
makedepends=(python-build python-installer python-setuptools python-wheel)
source=("${_base}-${pkgver}.tar.gz::https://github.com/${_base}/${_base}/archive/r${pkgver}.tar.gz")
sha512sums=('0ac6f1336a88e4f6047e63374c669f21fb52a7d249df695aca8bd996f7128cc301191894c805590271a38e0925b4f7846b2864d61fa923a76ec516071d91a714')

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
