# Contributor: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: tuftedocelot <tuftedocelot@fastmail.fm>
_base=filterpy
pkgname=python-${_base}
pkgver=1.4.5
pkgrel=2
pkgdesc="Kalman filtering and optimal estimation library"
arch=(any)
url="https://github.com/rlabbe/${_base}"
license=(MIT)
depends=(python-scipy python-matplotlib)
makedepends=(python-build python-installer python-setuptools python-wheel)
source=(${_base}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz)
sha512sums=('22bc58142249f32d58aa7395342f455ef97469cf26635c5551634a5e4987ad7ef559ead38a3ebacfa447927c96f6ded5d08d2273ec8e86a26288c851ca6a63e5')

build() {
  cd ${_base}-${pkgver}
  python -m build --wheel --skip-dependency-check --no-isolation
}

package() {
  cd ${_base}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
