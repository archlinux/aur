# Maintainer: Kef Schecter <furrykef@gmail.com>

pkgname=pyboy
pkgver=2.4.1
pkgrel=2
pkgdesc='A scriptable Game Boy emulator written in Python'
arch=('x86_64')
url='https://github.com/Baekalfen/PyBoy'
license=('LGPL-3.0-only')
depends=('python-numpy' 'python-pysdl2')
makedepends=('cython' 'python-build' 'python-installer' 'python-wheel')
optdepends=('python-opengl: OpenGL support'
            'python-pillow: screen/video capture support')
checkdepends=('python-cryptography' 'python-filelock' 'python-gitpython' 'python-pillow' 'python-pytest' 'python-pytest-lazy-fixtures' 'python-pytest-xdist' 'xorg-server-xvfb')
source=("$pkgname-$pkgver.tar.gz::https://github.com/Baekalfen/PyBoy/archive/refs/tags/v$pkgver.tar.gz")
b2sums=('90cb9c20464b27660d972f7c7df412ba6e09bd0db9fe34a307784a684442d6c68a849f1bb213312eca4832f0ed34293e2dc709828f708bad0c33a0d8fee55863')

build() {
    cd "PyBoy-$pkgver"
    python -m build --wheel --no-isolation
}

check() {
    cd "PyBoy-$pkgver"
    # xvfb-run is used to avoid spawning windows during testing
    xvfb-run pytest
}

package() {
    cd "PyBoy-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}

