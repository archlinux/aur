# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=pacopy
pkgname=python-${_base}
pkgdesc="Numerical parameter continuation in Python"
pkgver=0.1.6
pkgrel=2
arch=('x86_64')
url="https://github.com/nschloe/${_base}"
license=(GPL3)
depends=(python)
makedepends=(python-setuptools)
# checkdepends=(python-pytest-codeblocks python-matplotlib python-cplot python-meshplex python-meshzoo python-scipy python-pyfvm python-pykry)
source=(https://pypi.org/packages/source/${_base::1}/${_base}/${_base}-${pkgver}.tar.gz)
sha512sums=('99b2ba6ecf1dee7806f4e7b3edffde766ddeb5508f41f39cea7779fbf0a3906437e650a361c82d9e4beeafede7c7bb1087da00a383847bb8a1d4aacf70632e05')

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
