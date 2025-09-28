# Maintainer: Keyboard Slayer <github.com/keyboard-slayer>
# Maintainer: Monax (SMNX) <github.com/sleepy-monax>

pkgname=cutekit-git
pkgver=0.9.3
pkgrel=1
pkgdesc="An operating system development kit."
arch=('any')
url="https://github.com/cute-engineering/cutekit"
license=('MIT')
depends=('python' 'ninja' 'python-requests' 'python-graphviz' 'graphviz' 'python-dataclasses-json')
makedepends=('git' 'python-setuptools')
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
