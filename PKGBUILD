# Maintainer: Kef Schecter <furrykef@gmail.com>

pkgname=pyboy
pkgver=2.4.0
pkgrel=1
pkgdesc='A Game Boy emulator written in Python'
arch=('x86_64')
url='https://github.com/Baekalfen/PyBoy'
license=('LGPL-3.0-only')
depends=('python-numpy' 'python-pysdl2')
makedepends=('cython' 'python-build' 'python-installer' 'python-wheel')
optdepends=('python-opengl' 'python-pillow')
#checkdepends=('python-cryptography' 'python-filelock' 'python-pytest' 'python-pytest-lazy-fixtures' 'python-pytest-xdist')
source=("$pkgname-$pkgver.zip::https://github.com/Baekalfen/PyBoy/archive/refs/tags/v$pkgver.zip")
b2sums=('a8c04e755401932df01a82c0b1d21f40d28f5c9a2d82422d6d65b88cedf7f0bb274c3ea1203f17022bca09f726dfdf70d663be7bcf6e4806ddc72cc42f4f50b1')

build() {
    cd "PyBoy-$pkgver"
    python -m build --wheel --no-isolation
}

# Skip tests because they take too long, are disruptive, and require a GUI session
#check() {
#    cd "PyBoy-$pkgver"
#    pytest
#}

package() {
    cd "PyBoy-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}

