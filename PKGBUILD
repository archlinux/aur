# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=scikit-build-core
pkgname=pypy3-${_base}
pkgdesc="Build backend for CMake based projects"
pkgver=1.1.0
pkgrel=1
arch=(any)
url="https://github.com/${_base/-core/}/${_base}"
license=(Apache-2.0)
depends=(cmake ninja pypy3-packaging pypy3-pathspec)
makedepends=(pypy3-build pypy3-installer pypy3-hatch-vcs)
source=(${_base}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
sha512sums=('df778bb4e3a38e2bda445a5154c0cd475c9ccdc70b3ea63c270a7165feac29292717c0a7862be7f1bf30356f501a19c42c34c291f568931a56e920a702012402')

build() {
  cd ${_base}-${pkgver}
  export SETUPTOOLS_SCM_PRETEND_VERSION=${pkgver}
  pypy3 -m build --wheel --skip-dependency-check --no-isolation
}

package() {
  cd ${_base}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" pypy3 -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
