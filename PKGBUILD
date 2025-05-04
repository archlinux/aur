# Maintainer: Kef Schecter <furrykef@gmail.com>

pkgname=pyboy
pkgver=2.5.3
pkgrel=1
pkgdesc='A scriptable Game Boy emulator written in Python'
arch=('x86_64')
url='https://github.com/Baekalfen/PyBoy'
license=('LGPL-3.0-only')
depends=('python-numpy' 'python-pysdl2')
makedepends=('cython' 'python-build' 'python-installer' 'python-wheel')
optdepends=('python-opengl: OpenGL support'
            'python-pillow: screen/video capture support')
#checkdepends=('python-cryptography' 'python-filelock' 'python-gitpython' 'python-matplotlib' 'python-pillow' 'python-pytest' 'python-pytest-benchmark' 'python-pytest-lazy-fixtures' 'python-pytest-xdist' 'xorg-server-xvfb')
source=("$pkgname-$pkgver.tar.gz::https://github.com/Baekalfen/PyBoy/archive/refs/tags/v$pkgver.tar.gz")
b2sums=('95196f415c2c07b9aff708b4a34730066efef3012d6b7ee9f9c283b4b07b188d564506ac5bb18b699aff45f98e95c535e6c589d69b53a9a71552ea6c4583b75c')

build() {
    cd "PyBoy-$pkgver"
    python -m build --wheel --no-isolation
}

# Tests disabled for now; they crash due to an apparent bug in the test suite
# Re-enable them for 2.5.4 if they work then
#check() {
#    cd "PyBoy-$pkgver"
#    # xvfb-run is used to avoid spawning windows during testing
#    xvfb-run pytest
#}

package() {
    cd "PyBoy-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}

