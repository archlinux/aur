# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=platformdirs
pkgname=pypy3-${_base}
pkgdesc="A small Python package for determining appropriate platform-specific dirs"
pkgver=4.11.2
pkgrel=1
arch=(any)
url="https://github.com/tox-dev/${_base}"
license=(MIT)
depends=(pypy3)
makedepends=(pypy3-build pypy3-installer pypy3-hatch-vcs)
source=(${_base}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz)
sha512sums=('158f98560ffd59c70df0e7e804cee0f9e7fecefc142c062562db97ef39a0e165cf5594504240bb3edd572a59bdb08de4e0b25840dcd1bbb0259c2128832a3dd0')

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
