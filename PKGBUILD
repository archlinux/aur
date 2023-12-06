# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=FireflyAlgorithm
pkgname=python-${_base,,}
pkgdesc="Implementation of Firefly Algorithm in Python"
pkgver=0.4.2
pkgrel=1
arch=(any)
url="https://github.com/firefly-cpp/${_base}"
license=(MIT)
depends=(python-numpy)
makedepends=(python-build python-installer python-poetry-core)
checkdepends=(python-pytest)
source=(${_base}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz)
sha512sums=('a6a536d77f7779707c4d6428d66623bb85145eeb3f5784ecf90be1f1a16ad1b5dfc36b925f9cd9f34acc85309ff3455137026225a30a1514d9ea2159ccbfb21a')

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
