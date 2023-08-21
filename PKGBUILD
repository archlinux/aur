# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=symfem
pkgname=python-${_base}
pkgver=2023.8.2
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
sha512sums=('f4309532d8ec8efa6d711c26e6151957461e70d0f61e8b369749564fa1fb17ed2d12cfc916c65b042626ae48413d2b9c4b47133a014366d70f47e0c210ea029c')

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
