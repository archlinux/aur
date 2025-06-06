# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=kiwi
pkgname=pypy3-${_base}solver
pkgdesc="A fast implementation of the Cassowary constraint solver"
pkgver=1.4.6
pkgrel=1
arch=(any)
url="https://github.com/nucleic/${_base}"
license=(Artistic-1.0-Perl)
depends=(pypy3)
makedepends=(pypy3-build pypy3-installer pypy3-setuptools-scm pypy3-cppy)
source=(${_base}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz)
sha512sums=('ac4fabf1256ee96614461e201c1da579b62403b82dd7f44d9b05b2d43c5faba9787e2bb3dcee6fb59b5f8fb32fc72ac50489ac4a42d08fdfc3e94687a0328580')

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
