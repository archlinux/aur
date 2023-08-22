# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=splines
pkgname=python-${_base}
pkgver=0.3.1
pkgrel=1
pkgdesc="Splines in Euclidean Space and Beyond"
arch=(any)
url="https://${_base}.readthedocs.io"
license=(MIT)
depends=(python-scipy)
makedepends=(python-build python-installer python-setuptools python-wheel)
checkdepends=(python-pytest)
source=(${_base}-${pkgver}.tar.gz::https://github.com/AudioSceneDescriptionFormat/${_base}/archive/${pkgver}.tar.gz)
sha512sums=('08cd84fbb68c9953e6297b67767741fdd724db613af493c723f080697037c4661af86c1e8cbe19764000ae7a71f0e8074ff78f9deb4ebdb9d0cc7d77ffd11b93')

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
