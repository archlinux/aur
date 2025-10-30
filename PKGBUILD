# Maintainer: Keyboard Slayer <github.com/keyboard-slayer>
# Maintainer: Monax (SMNX) <github.com/sleepy-monax>
# Maintainer: Mathilde <github.com/Mathilde411>

pkgname=cutekit-git
pkgver=0.10.0
pkgrel=1
pkgdesc="The magical build system and package manager"
arch=('any')
url="https://github.com/cute-engineering/cutekit"
license=('MIT')
depends=('python>=3.11' 'ninja' 'python-requests' 'python-graphviz' 'graphviz' 'python-dataclasses-json')
makedepends=('git' 'python-setuptools')
checkdepends=('python-pytest')
optdepends=('clang: for compiling C/C++ code'
            'llvm: tools for C/C++ development'
            'lld: for linking'
            'nasm: for compiling assembly code')
source=("${pkgname}::git+https://github.com/cute-engineering/cutekit.git#branch=stable")
sha256sums=('SKIP')
provides=('cutekit')
conflicts=('cutekit')

pkgver() {
    cd "$srcdir/$pkgname/cutekit"
    grep 'VERSION =' const.py | grep -Po '\(\K[0-9, ]+(?=\))' | tr -d ' ' | tr ',' '.'
}

build() {
    cd "$srcdir/$pkgname"
    python -m build --wheel --no-isolation
}

package() {
    cd "$srcdir/$pkgname"
    python -m installer --destdir="$pkgdir" dist/*.whl
}

check() {
    cd "$srcdir/$pkgname"
    python -m pytest
}
