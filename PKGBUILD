# Maintainer: gilcu3
_pkgname=ctranslate2
pkgname=python-$_pkgname-bin
pkgver=3.23.0
pkgrel=1
pkgdesc="CTranslate2 is a C++ and Python library for efficient inference with Transformer models."
arch=('x86_64')
url="https://github.com/OpenNMT/CTranslate2"
license=('MIT')
provides=("ctranslate2")
conflicts=('ctranslate2-git' 'python-ctranslate2-git')
depends=('python>=3.7' 'python-numpy' 'python-yaml')
makedepends=('python-pip')
_py=cp311
wheel_name=${_pkgname//-/_}-$pkgver-$_py-${_py}-manylinux_2_17_$arch.manylinux2014_$arch.whl
source=(https://files.pythonhosted.org/packages/$_py/${_pkgname::1}/$_pkgname/$wheel_name)
sha256sums=('cf8a0d3085297373208f6e703e096bfd3b19ec80bf133e006fdcd7e88996b11b')

package() {
    pip install --isolated --upgrade --no-deps --ignore-installed --root=$pkgdir --no-warn-script-location $wheel_name
    python -m compileall -d /usr "$pkgdir"/usr
    python -O -m compileall -d /usr "$pkgdir"/usr
}
