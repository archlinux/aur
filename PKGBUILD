# Maintainer: Letu Ren <fantasquex at gmail dot com>

pkgname=python-pypcode
pkgver=1.0.5
pkgrel=1
pkgdesc="Python bindings to Ghidra's SLEIGH library for disassembly and IR translation"
arch=('x86_64')
url="https://github.com/angr/pypcode"
license=('BSD')
depends=('python')
makedepends=('cmake' 'python-setuptools' 'python-cffi' 'python-build' 'python-installer' 'python-wheel')
_name=${pkgname#python-}
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('3433abc26f424d0db2b84a7cd088cfbbfda44849d56bae00ef956f9bd35d8777')

build() {
    cd "${_name}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${_name}-${pkgver}"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

