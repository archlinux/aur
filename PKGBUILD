# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=platformdirs
pkgname=pypy3-${_base}
pkgdesc="A small Python package for determining appropriate platform-specific dirs"
pkgver=4.9.6
pkgrel=1
arch=(any)
url="https://github.com/tox-dev/${_base}"
license=(MIT)
depends=(pypy3)
makedepends=(pypy3-build pypy3-installer pypy3-hatch-vcs)
source=(${_base}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz)
sha512sums=('f693b977d22a4acd49bd2a0b2efecb1a40e8c51d604a5ac5fbf4f7c4646607a2150047ef53ada89987ff4f89a67e8c1c25b32ea493f8ad62736f9f8f143b7036')

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
