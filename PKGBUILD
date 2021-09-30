# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=pacopy
pkgname=python-${_base}
pkgdesc="Numerical parameter continuation in Python"
pkgver=0.1.4
pkgrel=1
arch=('x86_64')
url="https://github.com/nschloe/${_base}"
license=(GPL3)
depends=(python)
makedepends=(python-setuptools)
# checkdepends=(python-pytest-codeblocks python-matplotlib python-cplot python-meshplex python-meshzoo python-scipy python-pyfvm python-pykry)
source=(${url}/archive/v${pkgver}.tar.gz)
sha512sums=('e465e1bde24f3a14e44f84b357cea5a70354e1c6946346adff70079e2e64de9546603c76d25e1e445e8e1f9e8b8d33083a0c04f3a57a96a6f4378fd51bc9278e')

build() {
  cd "${_base}-${pkgver}"
  python -c "from setuptools import setup; setup();" build
}

# check() {
#   cd "${_base}-${pkgver}"
#   python -c "from setuptools import setup; setup();" install --root="${PWD}/tmp_install" --optimize=1 --skip-build
#   MPLBACKEND=Agg PYTHONPATH="${PWD}/tmp_install$(python -c "import site; print(site.getsitepackages()[0])"):${PYTHONPATH}" python -m pytest --codeblocks
# }

package() {
  cd "${_base}-${pkgver}"
  export PYTHONHASHSEED=0
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -c "from setuptools import setup; setup();" install --prefix=/usr --root="${pkgdir}" --optimize=1 --skip-build
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
