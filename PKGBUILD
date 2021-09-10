# Maintainer: Sam L. Yes <samlukeyes123@gmail.com>

_name=paddlepaddle
pkgname=$_name-bin
_py=cp39
pkgver=2.1.2
pkgrel=1
pkgdesc="Machine Learning Framework from Industrial Practice"
url="https://github.com/PaddlePaddle/Paddle"
depends=('python-protobuf' 'python-numpy' 'python-gast' 'python-astor' 'perl')
makedepends=('python-pip' 'python-wheel')
provides=($_name=$pkgver)
conflicts=($_name $_name-gpu)
license=('Apache')
arch=('x86_64')
_wheel=${_name//-/_}-$pkgver-$_py-${_py}-manylinux1_x86_64.whl
source=(https://files.pythonhosted.org/packages/$_py/${_name::1}/$_name/$_wheel)
sha256sums=('5a7a752df7cd7cfc07b555f2957934cb3cdae9eeaabb12fb0b1129019b9a04ac')

package() {
    export PIP_CONFIG_FILE=/dev/null 
    pip install --isolated --root="$pkgdir" --ignore-installed --no-deps $_wheel
    python -O -m compileall "${pkgdir}"
}
