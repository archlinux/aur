# Maintainer: Marco Rubin <marco.rubin@protonmail.com>

_name=imgui
pkgname=python-$_name
pkgver=2.0.0
pkgrel=3
pkgdesc='Cython-based Python bindings for dear imgui'
arch=(any)
url='https://github.com/pyimgui/pyimgui'
license=('MIT')
depends=(python python-glfw python-opengl)
makedepends=(
    cython0
    python-build
    python-click
    python-installer
    python-setuptools
    python-wheel
)
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
b2sums=('233095f7a0f0fffe2a251d871afeec43fa55463a69664ce66fb6afbf377bba953c528f5be1353e2b1dbe4ee812fa8bb4ac4c2b1ba3bb8dffebfc8f4e4533842c')

build() {
    cd "$_name-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$_name-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
