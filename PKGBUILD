_base=cplot
pkgname=python-${_base}
pkgdesc="Color maps for complex-valued functions"
pkgver=0.5.2
pkgrel=1
arch=('x86_64')
url="https://github.com/nschloe/${_base}"
license=(GPL3)
depends=(python-colorio)
makedepends=(python-setuptools)
checkdepends=(python-pytest-codeblocks) # python-mpmath python-scipy python-meshzoo
source=(${url}/archive/v${pkgver}.tar.gz)
sha512sums=('f964e826c29dc7d8f9b15f5f724cc1a7d236e3c2c9476dc3d98111793c4960718bfb899e7477d6b36d4d403d1baf3599503a6d1f51c4204a38e2451268442865')

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
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -c "from setuptools import setup; setup();" install --root="${pkgdir}" --optimize=1 --skip-build
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
