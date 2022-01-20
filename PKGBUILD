# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Sam L. Yes <samlukeyes123@gmail.com>
_base=paddlepaddle
pkgname=${_base}-bin
pkgver=2.2.2
pkgrel=1
pkgdesc="Machine Learning Framework from Industrial Practice"
url="https://${_base}.org.cn"
depends=(python-protobuf python-numpy python-gast python-astor perl)
makedepends=(python-pip) # python-wheel
provides=(${_base}=${pkgver})
conflicts=(${_base} ${_base}-gpu)
license=('Apache')
arch=('x86_64')
# _pyversion=$(python -c "import sys; print(f'cp{sys.version_info.major}{sys.version_info.minor}')")
_wheel="${_base}-${pkgver}-cp39-cp39-manylinux1_${CARCH}"
source=(https://pypi.org/packages/cp39/${_base::1}/${_base}/${_wheel}.whl)
sha256sums=('1171809cb4d6a2c300a3e870f716d6093b19f93a142b12eb033fe29dac5794f7')

package() {
  PIP_CONFIG_FILE=/dev/null pip install --isolated --root="${pkgdir}" --ignore-installed --no-deps ./*whl
  python -O -m compileall "${pkgdir}$(python -c "import site; print(site.getsitepackages()[0])")/${_base}"
}