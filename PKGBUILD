# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Ryan Greenblatt <ryan_greenblatt at brown dot edu>
_base=sympy
pkgname=python-${_base}-git
pkgver=1.14.0.r572.g55db3ae
pkgrel=1
pkgdesc="Computer algebra system (CAS) in Python (git version)"
arch=(any)
url="https://${_base}.org"
license=(BSD)
depends=(python-mpmath)
makedepends=(python-build python-installer python-setuptools git)
provides=(python-${_base})
conflicts=(python-${_base})
optdepends=('ipython: user friendly interface for isympy'
  'python-symengine: optimized backend, set USE_SYMENGINE=1 to use')
source=(git+https://github.com/${_base}/${_base}.git#branch=master)
sha512sums=('SKIP')

pkgver() {
  cd ${_base}
  git describe --long --tags --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd ${_base}
  python -m build --wheel --skip-dependency-check --no-isolation
}

package() {
  cd ${_base}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm 644 LICENSE -t "${pkgdir}"/usr/share/licenses/"${pkgname}"
}
