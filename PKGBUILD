# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Will Handley <wh260@cam.ac.uk> (aur.archlinux.org/account/wjhandley)
_base=ripser
pkgname=python-${_base}
pkgver=0.6.13
pkgrel=1
pkgdesc="A Lean Persistent Homology Library for Python"
arch=(x86_64)
url="https://github.com/scikit-tda/${_base}.py"
license=(MIT)
depends=(python-persim)
makedepends=(python-build python-installer python-setuptools python-wheel cython)
checkdepends=(python-pytest)
changelog=CHANGELOG.md
source=(${_base}.py-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
sha512sums=('b2c7c604bec80942ea14466007f71e6ae5ba12fcd04970654ed9dfc4e5a9c06daf206089544934ae99306a05799cbea4b51a379428d910b1a4de9112022073ea')

build() {
  cd ${_base}.py-${pkgver}
  python -m build --wheel --skip-dependency-check --no-isolation
}

check() {
  cd ${_base}.py-${pkgver}
  python -m venv --system-site-packages test-env
  test-env/bin/python -m installer dist/*.whl
  test-env/bin/python -m pytest
}

package() {
  cd ${_base}.py-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm 644 LICENSE.txt -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
