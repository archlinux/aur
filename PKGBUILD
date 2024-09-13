# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=sympde
pkgname=python-${_base,,}
pkgdesc="Symbolic calculus for partial differential equations"
pkgver=0.19.0
pkgrel=1
arch=(any)
url="https://github.com/pyccel/${_base}"
license=(MIT)
depends=(python-sympy python-h5py python-pytest python-yaml python-matplotlib)
makedepends=(python-build python-installer python-setuptools python-wheel)
source=(${_base}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
sha512sums=('b3c3174ec8b872435f8985548b4769e3e0ea945e21fb8502cd39dab338a28aec838d699e5f3b85843943d1d98fe6377ce983624c91731c03339f04f771fe1e9b')

build() {
  cd ${_base}-${pkgver}
  python -m build --wheel --skip-dependency-check --no-isolation
}

package() {
  cd ${_base}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
