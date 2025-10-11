# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=platformdirs
pkgname=pypy3-${_base}
pkgdesc="A small Python package for determining appropriate platform-specific dirs"
pkgver=4.5.0
pkgrel=1
arch=(any)
url="https://github.com/tox-dev/${_base}"
license=(MIT)
depends=(pypy3)
makedepends=(pypy3-build pypy3-installer pypy3-hatch-vcs)
source=(${_base}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz)
sha512sums=('a01a4f6ee3359546097aefb3f40dfea84961e192d6902e11205792b260e3fed440baec91be7ed19c95d3979ed64bb9c8c9e4421a74ff5ec162b01dc22fd3ab46')

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
