# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=symfem
pkgname=python-${_base}
pkgver=2023.11.0
pkgrel=1
pkgdesc="a symbolic finite element definition library"
url="https://github.com/mscroggs/${_base}"
license=(MIT)
arch=(any)
depends=(python-sympy python-appdirs)
makedepends=(python-build python-installer python-setuptools python-wheel)
# checkdepends=(python-pytest python-numpy python-cairosvg texlive-latexextra	python-fenics-basix)
optdepends=('python-cairosvg: for plotting PNGs')
source=(${_base}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
sha512sums=('6a224d52f48483b4879913e058bf9fa31d73d198eb9d9f5262f920ee4cba9cc21ff30ca4573179e7b17db39c8e6634764080da75f8cc6d9cd01a75636de9e14f')

build() {
  cd ${_base}-${pkgver}
  python -m build --wheel --skip-dependency-check --no-isolation
}

# check() {
#   cd ${_base}-${pkgver}
#   python -m venv --system-site-packages test-env
#   test-env/bin/python -m installer dist/*.whl
#   test-env/bin/python -m pytest -k 'not elements and not' -vv
# }

package() {
  cd ${_base}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
  rm -r "${pkgdir}/usr/test"
  rm "${pkgdir}/usr/LICENSE" "${pkgdir}/usr/README.md"
}
