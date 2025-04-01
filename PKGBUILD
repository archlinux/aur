# Maintainer: Kef Schecter <furrykef@gmail.com>

pkgname=pyboy
pkgver=2.5.2
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
b2sums=('eb6ec5f32aeea4ac0e4586ca2a14542adc6f565d155835b79bb98ecaddcc6a1510e6df207a7afc212c1601cd8fa17236160466a8cfce78304a94e28c712dd144')

build() {
    cd "PyBoy-$pkgver"
    python -m build --wheel --no-isolation
}

# Tests disabled for now; they crash due to an apparent bug in the test suite
# Re-enable them for 2.5.3 if they work then
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

