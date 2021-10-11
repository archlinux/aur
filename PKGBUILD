# Maintainer: Sam L. Yes <samlukeyes123@gmail.com>

_name=paddlepaddle
pkgname=$_name-bin
_py=cp39
pkgver=2.1.3
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
sha256sums=('34fad7293b318ee5f992ee607c690b5cdb8f74d50bae93ff66b12a1bfe1bb168')

package() {
    export PIP_CONFIG_FILE=/dev/null 
    pip install --isolated --root="$pkgdir" --ignore-installed --no-deps $_wheel
    python -O -m compileall "${pkgdir}"
}
