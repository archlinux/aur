# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=symfem
pkgname=python-${_base}
pkgver=2023.12.11
pkgrel=1
pkgdesc="a symbolic finite element definition library"
url="https://github.com/mscroggs/${_base}"
license=(MIT)
arch=(any)
depends=(python-sympy python-appdirs)
makedepends=(python-build python-installer python-flit-core python-setuptools python-wheel)
# checkdepends=(python-pytest python-numpy python-cairosvg texlive-latexextra	python-fenics-basix)
optdepends=('python-cairosvg: for plotting PNGs')
source=(${_base}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
sha512sums=('bf38497bf924a9a41811ef6878618dcb58d566be061f1c6f08fbc071a4c3f459b2a710719c92f0ecffc7c0971b94e0a9b5051588c86bd33e0305919736df09f3')

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
