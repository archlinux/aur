# Maintainer: Kef Schecter <furrykef@gmail.com>

pkgname=pyboy
pkgver=2.5.1
pkgrel=1
pkgdesc='A scriptable Game Boy emulator written in Python'
arch=('x86_64')
url='https://github.com/Baekalfen/PyBoy'
license=('LGPL-3.0-only')
depends=('python-numpy' 'python-pysdl2')
makedepends=('cython' 'python-build' 'python-installer' 'python-wheel')
optdepends=('python-opengl: OpenGL support'
            'python-pillow: screen/video capture support')
#checkdepends=('python-cryptography' 'python-filelock' 'python-gitpython' 'python-pillow' 'python-pytest' 'python-pytest-benchmark' 'python-pytest-lazy-fixtures' 'python-matplotlib' 'python-pytest-xdist' 'xorg-server-xvfb')
source=("$pkgname-$pkgver.tar.gz::https://github.com/Baekalfen/PyBoy/archive/refs/tags/v$pkgver.tar.gz")
b2sums=('ea91b10bfef579dffc2db9b1a4bb99c33efb969e49718c89a4aea5b72521bc1ce388aa174a3b9ae4dc94c85182d2b1bf4249536544a7fce70e63ce15c9401320')

build() {
    cd "PyBoy-$pkgver"
    python -m build --wheel --no-isolation
}

# Tests disabled for now; they crash due to a bug in the test suite
# Re-enable them for 2.5.2
#check() {
#    cd "PyBoy-$pkgver"
#    # xvfb-run is used to avoid spawning windows during testing
#    # test_swoosh is excluded because it turns out not to be portable in 2.5.0
#    # This will probably change in future versions
#    xvfb-run pytest -k "not test_swoosh"
#}

package() {
    cd "PyBoy-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}

