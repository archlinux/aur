# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: David McInnis <dave@dave3.xyz>
_base=mahotas
pkgname=python-${_base}
pkgdesc="Computer Vision in Python"
pkgver=1.4.18
pkgrel=1
arch=(x86_64)
url="https://github.com/luispedro/${_base}"
license=(MIT)
depends=(python-numpy)
makedepends=(python-build python-installer python-setuptools python-wheel)
# checkdepends=(python-pytest python-pillow python-scipy)
optdepends=('python-imread: for function imread support'
  'python-pillow: for function imread support'
  'freeimage: for functions imread/imsave support')
provides=('mahotas')
source=(${_base}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
sha512sums=('57ff46be660ddb8827a5e73ff1dc9bbc05b146d06e48a24a6607ffe7d5bb9ee81dda8a1f51edd3e7714cc2a6cb86716420e5c740b3ca670c4d834d4f57b8a15a')
# validpgpkeys=('6FB8B07A620CC7A7FB5B2AB4110D6C98E760BEF2') # Lu\xed\x73 Pedro Coelho <lpc@cmu.edu>

build() {
  cd ${_base}-${pkgver}
  python -m build --wheel --skip-dependency-check --no-isolation
}

# check() {
#   # https://github.com/luispedro/mahotas/issues/129
#   local _pyversion=$(python -c "import sys; print(f'{sys.version_info.major}.{sys.version_info.minor}')")
#   PYTHONPATH="${_base}/build/lib.linux-${CARCH}-${_pyversion}:${PYTHONPATH}" python -c "import mahotas as mh; mh.test()"
# }

package() {
  cd ${_base}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm 644 COPYING -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm 644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}"
}
