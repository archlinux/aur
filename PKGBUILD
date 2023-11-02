# Maintainer: gilcu3
_pkgname=onnxruntime
pkgname=python-$_pkgname-bin
pkgver=1.16.1
pkgrel=1
pkgdesc="Cross-platform, high performance scoring engine for ML models (Python Bindings)"
arch=('x86_64')
url="https://github.com/OpenNMT/CTranslate2"
license=('MIT')
provides=("python-onnxruntime")
conflicts=('python-onnxruntime')
depends=('python>=3.7' python-flatbuffers python-humanfriendly python-coloredlogs)
makedepends=('python-pip')
_py=cp311
wheel_name=${_pkgname//-/_}-$pkgver-$_py-${_py}-manylinux_2_17_$arch.manylinux2014_$arch.whl
source=(https://files.pythonhosted.org/packages/py3/${_pkgname::1}/$_pkgname/$wheel_name)
sha256sums=('025c7a4d57bd2e63b8a0f84ad3df53e419e3df1cc72d63184f2aae807b17c13c')

package() {
  PIP_CONFIG_FILE=/dev/null pip install --isolated --upgrade --no-deps --ignore-installed --root=$pkgdir --no-warn-script-location --no-compile  $wheel_name --no-index
  cd $pkgdir
  python -m compileall -d /usr "$pkgdir"/usr
  python -O -m compileall -d /usr "$pkgdir"/usr
}
