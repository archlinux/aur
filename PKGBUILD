# Maintainer: Sam L. Yes <samlukeyes123@gmail.com>

_name=VisualDL
pkgname=visualdl
pkgver=2.2.1
pkgrel=2
pkgdesc="Deep Learning Visualization Toolkit"
url="https://github.com/PaddlePaddle/VisualDL"
depends=(
    'python-baidubce'
    'flake8'
    'python-flask-babel'
    'python-pillow'
    'python-protobuf'
    'python-requests'
    'python-six'
    'python-matplotlib'
    'python-pandas'
)
makedepends=(
    'python-setuptools' 'python-pre-commit' 'rustup' 'npm' 'yarn' 'shellcheck'
)
license=('Apache')
arch=('any')
source=($pkgname-$pkgver.tar.gz::https://github.com/PaddlePaddle/VisualDL/archive/refs/tags/v$pkgver.tar.gz)
md5sums=('8a0c393ba68956de94dce5aabc7e456b')

prepare() {
    cd $srcdir/${_name}-${pkgver}
    sed -i '/pre-commit/d;/shellcheck/d' requirements.txt
}

build() {
    rustup toolchain install stable
    cd $srcdir/${_name}-${pkgver}
    rustup run stable python setup.py build
}

package() {
    cd $srcdir/${_name}-${pkgver}
    python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
