# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Sam L. Yes <samlukeyes123@gmail.com>
_base=paddlepaddle
pkgname=${_base}-bin
pkgver=2.3.0
pkgrel=1
pkgdesc="Machine Learning Framework from Industrial Practice"
url="https://${_base}.org.cn"
depends=(python-requests python-numpy python-protobuf python-pillow python-six python-decorator python-astor python-paddle_bfloat python-opt_einsum perl)
makedepends=(python-pip)
provides=(${_base}=${pkgver})
conflicts=(${_base} ${_base}-gpu)
license=('Apache')
arch=('x86_64')
_pyversion=$(python -c "import sys; print(f'cp{sys.version_info.major}{sys.version_info.minor}')")
_wheel="${_base}-${pkgver}-${_pyversion}-${_pyversion}-manylinux1_${CARCH}"
source=(https://pypi.org/packages/${_pyversion}/${_base::1}/${_base}/${_wheel}.whl)
sha256sums=('720103a4f0f4614c253c8077011a9d60b505ddee2175b585b95ba1905079c037')

package() {
  PIP_CONFIG_FILE=/dev/null pip install --isolated --root="${pkgdir}" --ignore-installed --no-deps ./*whl
  python -O -m compileall "${pkgdir}$(python -c "import site; print(site.getsitepackages()[0])")/${_base}"
}
