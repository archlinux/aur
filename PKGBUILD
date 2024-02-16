# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Maintainer: PumpkinCheshire <me at pumpkincheshire dot com>
# Contributor: Ishan Arora <ishanarora@gmail.com>
_base=oct2py
pkgname=python-${_base}
pkgver=5.6.0
pkgrel=1
pkgdesc="Python to GNU Octave bridge --> run m-files from python"
arch=(any)
url="http://github.com/blink1073/${_base}"
license=(MIT)
depends=(python-scipy jupyter-octave_kernel gnuplot)
makedepends=(python-build python-installer python-setuptools python-hatchling python-wheel)
optdepends=('python-pytest: for test use'
  'python-pandas: for test use'
  'jupyter-nbconvert: for test use')
source=(https://pypi.org/packages/source/${_base::1}/${_base}/${_base}-${pkgver}.tar.gz)
b2sums=('e22aca80608e1132f2cb8936e9dac7c97bd8e5463b6997dd80f0ed567af2a59a28b4c58995b11e2c1a970bc0bde81afda432d8ce5306b2eb5417b1f75b8b4b19')

build() {
  cd ${_base}-${pkgver}
  python -m build --wheel --skip-dependency-check --no-isolation
}

package() {
  cd ${_base}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm 644 LICENSE.txt -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
