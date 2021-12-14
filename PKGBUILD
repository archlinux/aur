# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=pytest-variables
pkgname=python-${_base}
pkgdesc="pytest plugin for providing variables to tests/fixtures"
pkgver=1.9.0
pkgrel=2
arch=('any')
url="https://github.com/pytest-dev/${_base}"
license=(MPL2)
depends=(python-pytest)
makedepends=(python-setuptools-scm git)
# checkdepends=(python-hjson python-yaml python-toml)
optdepends=('python-hjson: for json support'
  'python-yaml: for YAML support'
  'python-toml: for TOML support')
source=("git+${url}.git?#tag=v${pkgver}")
sha512sums=('SKIP')

build() {
  cd "${_base}"
  python setup.py build
}

# check() {
#   cd "${_base}"
#   python setup.py install --root="${PWD}/tmp_install" --optimize=1 --skip-build
#   PYTHONPATH="${PWD}/tmp_install$(python -c "import site; print(site.getsitepackages()[0])"):${PYTHONPATH}" python -m pytest # -p pytester
# }

package() {
  cd "${_base}"
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1 --skip-build
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
