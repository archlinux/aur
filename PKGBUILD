# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=openant
pkgname=python-${_base,,}
pkgdesc="ANT, ANT-FS and ANT+ Python Library"
pkgver=1.2.1
pkgrel=1
arch=(any)
url="https://github.com/Tigge/${_base}"
license=(MIT)
depends=(python-pyusb)
makedepends=(python-build python-installer python-setuptools python-wheel)
checkdepends=(python-pytest)
source=(${_base}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
sha512sums=('b4f65be19fbfa0fe662f38170203175d3f7d6d685b4d53d6fffde212745a37b7ee1321d9dbb4f419d0dc61254ceeaf0b14eea4e958fb634b7f0eaa3b084a4102')

build() {
  cd ${_base}-${pkgver}
  python -m build --wheel --skip-dependency-check --no-isolation
}

check() {
  cd ${_base}-${pkgver}
  python -m pytest ${_base}/tests
}

package() {
  cd ${_base}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --prefix=/usr --destdir="${pkgdir}" dist/*.whl
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
