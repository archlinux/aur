# Maintainer: Daniel Bermond <dbermond@archlinux.org>

pkgname=python-opcodes-git
pkgver=r243.b606dde
pkgrel=1
pkgdesc='Python module for instruction sets documentation in a format convenient for tools development (git version)'
arch=('any')
url='https://github.com/Maratyszcza/Opcodes/'
license=('BSD-2-Clause')
depends=('python' 'python-setuptools')
makedepends=('git' 'python-build' 'python-installer' 'python-wheel')
checkdepends=('python-pytest')
provides=('python-opcodes')
conflicts=('python-opcodes')
source=('git+https://github.com/Maratyszcza/Opcodes.git')
sha256sums=('SKIP')

pkgver() {
    printf 'r%s.%s' "$(git -C Opcodes rev-list --count HEAD)" "$(git -C Opcodes rev-parse --short HEAD)"
}

build() {
    cd Opcodes
    python -m build --wheel --no-isolation
}

check() {
    cd Opcodes
    PYTHONPATH="$(pwd)/build/lib" pytest
}

package_python-opcodes-git() {
    python -m installer --destdir="$pkgdir" Opcodes/dist/*.whl
    install -D -m644 Opcodes/LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
