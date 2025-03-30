# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Maintainer: Jordan Cook <JCook83@gmail.com>
# Contributor: Benoit Pierre <benoit.pierre@gmail.com>
# Contributor: Marc Plano-Lesay <kernald@enoent.fr>
_base=url-normalize
pkgname=python-${_base}
pkgdesc="URL normalization for Python"
pkgver=2.0.1
pkgrel=1
arch=(any)
url="https://github.com/niksite/${_base}"
license=(MIT)
depends=(python-idna)
makedepends=(python-build python-installer python-setuptools python-wheel)
# checkdepends=(python-pytest)
source=(${_base}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
sha512sums=('09c708d6de3e47329b2e416c0b73e8f44e91cb42d646d084add5d246c32c731b104d91a7288157da0bef7ba53356c702a749424db387db112591c11c4c43caf9')

build() {
  cd ${_base}-${pkgver}
  python -m build --wheel --skip-dependency-check --no-isolation
}

# check() {
#   cd ${_base}-${pkgver}
#   python -m venv --system-site-packages test-env
#   test-env/bin/python -m installer dist/*.whl
#   test-env/bin/python -m pytest tests
# }

package() {
  cd ${_base}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
