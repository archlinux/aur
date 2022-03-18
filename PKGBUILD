# Maintainer: Letu Ren <fantasquex at gmail dot com>

pkgname=python-pypcode
pkgver=1.0.4
pkgrel=2
pkgdesc="Python bindings to Ghidra's SLEIGH library for disassembly and IR translation"
arch=('x86_64')
url="https://github.com/angr/pypcode"
license=('BSD')
depends=('python')
makedepends=('cmake' 'python-setuptools' 'python-cffi' 'python-build' 'python-installer')
_name=${pkgname#python-}
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('11ac633a114bb3782f8fd235701f3795bbd134721dae97d913cf3721a58fe0ba')

build() {
    cd "${_name}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${_name}-${pkgver}"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

