# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Sam L. Yes <samlukeyes123@gmail.com>
_base=paddlepaddle
pkgname=${_base}-bin
pkgdesc="Parallel Distributed Deep Learning"
pkgver=2.6.1
pkgrel=1
arch=(x86_64)
url="https://${_base}.org.cn"
license=(Apache-2.0)
depends=(python-httpx python-numpy python-pillow python-decorator
  python-astor python-opt_einsum python-protobuf perl) # python-paddle_bfloat
makedepends=(python-pip)
_pyversion=cp311 # $(python -c "import sys; print(f'cp{sys.version_info.major}{sys.version_info.minor}')")
_wheel="${_base}-${pkgver}-${_pyversion}-${_pyversion}-manylinux1_${CARCH}"
source=(https://pypi.org/packages/${_pyversion}/${_base::1}/${_base}/${_wheel}.whl)
sha256sums=('a71106f146a5f4555f8fdcb8568add21e8604797d5b5e8527fa06c070494c1f5')
provides=("${_base}=${pkgver}")
conflicts=(${_base})

package() {
  XDG_CACHE_HOME="${PWD}" PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" PIP_CONFIG_FILE=/dev/null pip install --isolated --root="${pkgdir}" --ignore-installed --no-deps ./*whl
  python -O -m compileall "${pkgdir}$(python -c "import site; print(site.getsitepackages()[0])")/${_base}"
}
