# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Sam L. Yes <samlukeyes123@gmail.com>
_base=paddlepaddle
pkgname=${_base}-bin
pkgver=2.5.1
pkgrel=1
pkgdesc="Machine Learning Framework from Industrial Practice"
url="https://${_base}.org.cn"
depends=(python-requests python-numpy python-protobuf python-pillow python-decorator python-astor python-opt_einsum perl python-setuptools) # python-paddle_bfloat
makedepends=(python-pip)
provides=(${_base}=${pkgver})
conflicts=(${_base} ${_base}-gpu)
license=('Apache')
arch=('x86_64')
_pyversion=cp311 # $(python -c "import sys; print(f'cp{sys.version_info.major}{sys.version_info.minor}')")
_wheel="${_base}-${pkgver}-${_pyversion}-${_pyversion}-manylinux1_${CARCH}"
source=(https://pypi.org/packages/${_pyversion}/${_base::1}/${_base}/${_wheel}.whl)
sha256sums=('a171ada892b415bef9fa073c8590b26b050b31c6e73d0cc4229d64dd3bd02d7d')

package() {
  XDG_CACHE_HOME="${PWD}" PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" PIP_CONFIG_FILE=/dev/null pip install --isolated --root="${pkgdir}" --ignore-installed --no-deps ./*whl
  python -O -m compileall "${pkgdir}$(python -c "import site; print(site.getsitepackages()[0])")/${_base}"
}
