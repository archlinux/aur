# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Mark Oteiza <mvoteiza@udel.edu>
# Contributor: Antony Lee <anntzer dot lee at gmail dot com>
_base=colorspacious
pkgname=python-${_base}
pkgdesc="A powerful, accurate, and easy-to-use Python library for doing colorspace conversions"
pkgver=1.1.2
pkgrel=3
arch=(any)
url="https://github.com/njsmith/${_base}"
license=(MIT)
depends=(python-numpy)
makedepends=(python-build python-installer python-setuptools python-wheel)
source=(${_base}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
sha512sums=('c633ba1ee051eab055d74752b3efd02fdff9acd641f245d80339d698bf4f5a28701158a50ddd2c372730d7e5cbb1e29858c4acd1f3594e07fe7bdfaa2fed87f6')

build() {
  cd ${_base}-${pkgver}
  python -m build --wheel --skip-dependency-check --no-isolation
}

package() {
  cd ${_base}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm 644 LICENSE.txt -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
