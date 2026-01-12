# Contributor: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Caltlgin Stsodaat <contact@fossdaily.xyz>
# Contributor: Florian Wittmann
_base=typepy
pkgname=python-${_base}
pkgver=1.3.4
pkgrel=1
pkgdesc="Variable type checker/validator/converter at a run time"
arch=(any)
url="https://github.com/thombashi/${_base}"
license=(MIT)
depends=(python-mbstrdecoder)
makedepends=(python-build python-installer python-setuptools-scm)
# optdepends=('python-pytz')
# checkdepends=('python-pytest' 'python-tcolorpy' 'python-pytz')
source=(${_base}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
sha256sums=('7079e5358058dc60c308af1cf250087369508504f8377c41e254f9d50c1bb98a')

build() {
  cd ${_base}-${pkgver}
  export SETUPTOOLS_SCM_PRETEND_VERSION=${pkgver}
  python -m build --wheel --skip-dependency-check --no-isolation
}

# check() {
#   cd ${_base}-${pkgver}
#   python -m venv --system-site-packages test-env
#   test-env/bin/python -m installer dist/*.whl
#   test-env/bin/python -m pytest test
# }

package() {
  cd ${_base}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm 644 README.rst -t "${pkgdir}/usr/share/doc/${pkgname}"
}
