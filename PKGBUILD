# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=platformdirs
pkgname=pypy3-${_base}
pkgdesc="A small Python package for determining appropriate platform-specific dirs"
pkgver=4.10.0
pkgrel=1
arch=(any)
url="https://github.com/tox-dev/${_base}"
license=(MIT)
depends=(pypy3)
makedepends=(pypy3-build pypy3-installer pypy3-hatch-vcs)
source=(${_base}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz)
sha512sums=('370e482c918d5b38082ff5703b665b3fa50fb42db2d0adab0d0a8113a966b5e562cdeb9af16b5b391482b3460312476334db5785427f30d029751c63a3180a36')

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
