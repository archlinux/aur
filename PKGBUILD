# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=shenfun
pkgname=python-${_base}
pkgver=4.1.4
pkgrel=1
pkgdesc="High performance computational platform in Python for the spectral Galerkin method"
arch=(x86_64)
url="https://github.com/spectralDNS/${_base}"
license=(BSD-2-Clause)
depends=(python-mpi4py-fft python-scipy)
makedepends=(python-build python-installer python-setuptools python-wheel cython0)
source=(${_base}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz)
sha512sums=('7b64adefbf90bb3dd7295fe8952e7528ff59f4033b1366db2dca84a3303dec80b8ec5af3d3fe3bc172661b87b10e336fb14522976023a4657789ed971592cd90')

build() {
  cd ${_base}-${pkgver}
  python -m build --wheel --skip-dependency-check --no-isolation
}

package() {
  cd ${_base}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
