# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=splines
pkgname=python-${_base}
pkgver=0.3.3
pkgrel=1
pkgdesc="Splines in Euclidean Space and Beyond"
arch=(any)
url="https://${_base}.readthedocs.io"
license=(MIT)
depends=(python-scipy)
makedepends=(python-build python-installer python-setuptools python-wheel)
checkdepends=(python-pytest)
source=(${_base}-${pkgver}.tar.gz::https://github.com/AudioSceneDescriptionFormat/${_base}/archive/${pkgver}.tar.gz)
sha512sums=('a5bd5a41488c43dcb31be4f14f38b693bfc3ed506bc12b7447393e8d10dc4288191c8d526762c108048040e3e07a2a9b956637cc2041c382afdbcba9747f5025')

build() {
  cd ${_base}-${pkgver}
  python -m build --wheel --skip-dependency-check --no-isolation
}

check() {
  cd ${_base}-${pkgver}
  python -m venv --system-site-packages test-env
  test-env/bin/python -m installer dist/*.whl
  test-env/bin/python -m pytest
}

package() {
  cd ${_base}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
