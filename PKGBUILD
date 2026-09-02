# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=platformdirs
pkgname=pypy3-${_base}
pkgdesc="A small Python package for determining appropriate platform-specific dirs"
pkgver=4.11.7
pkgrel=1
arch=(any)
url="https://github.com/tox-dev/${_base}"
license=(MIT)
depends=(pypy3)
makedepends=(pypy3-build pypy3-installer pypy3-hatch-vcs)
source=(${_base}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz)
sha512sums=('6e1d5b854d558dd0db360ac3e1d25d005cdda8d9e2a03c4ad4bdddb89e857c6f5e669a618d466b8ff2c5bfed9c306e6acd2f99c3df554e24775a8a07e5c044b2')

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
