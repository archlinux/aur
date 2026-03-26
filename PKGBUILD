# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=setuptools-scm
pkgname=pypy3-${_base}
pkgdesc="the blessed package to manage your versions by scm tags"
pkgver=10.0.2
pkgrel=1
arch=(any)
url="https://github.com/pypa/${_base}"
license=(MIT)
depends=(pypy3-packaging pypy3-setuptools)
makedepends=(pypy3-build pypy3-installer)
source=(${_base}-${pkgver}.tar.gz::${url}/archive/${_base}-v${pkgver}.tar.gz)
sha512sums=('5563e0c8450bced90798dd533dd83349d68e18fb0744354687880b2523943554439a570c923ed1a27b3fb426b5d43e67376f9ec69e7d5059ed216c6416ba0793')

build() {
  cd ${_base}-${_base}-${pkgver}
  export SETUPTOOLS_SCM_PRETEND_VERSION=${pkgver}
  pypy3 -m build --wheel --skip-dependency-check --no-isolation
}

package() {
  cd ${_base}-${_base}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" pypy3 -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
