# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=FireflyAlgorithm
pkgname=python-${_base,,}
pkgdesc="Implementation of Firefly Algorithm in Python"
pkgver=0.4.0
pkgrel=1
arch=(any)
url="https://github.com/firefly-cpp/${_base}"
license=(MIT)
depends=(python-numpy)
makedepends=(python-build python-installer python-poetry-core)
checkdepends=(python-pytest)
source=(${_base}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz)
sha512sums=('286ce4079c6f68f877f44b749561ca2db95751dc763e1b6681bf57dc30a449692fc3b0f5edfe688df0702a9eff7d1b468ca23cd372be4ea99cbf52d711a3bb76')

build() {
  cd ${_base}-${pkgver}
  python -m build --wheel --skip-dependency-check --no-isolation
}

check() {
  cd ${_base}-${pkgver}
  python -m pytest
}

package() {
  cd ${_base}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
