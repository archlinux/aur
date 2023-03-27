# Maintainer: Marco Rubin <marco.rubin@protonmail.com>

_name=DearPyGui
pkgname=python-dearpygui
_commit=0e583d615966f80c4eef2e1e9d8d354b249ab25e
pkgver=1.9.0
pkgrel=1
pkgdesc='A fast and powerful Graphical User Interface Toolkit for Python with minimal dependencies'
arch=(x86_64)
url='https://github.com/hoffstadt/DearPyGui'
license=('MIT')
depends=(python)
makedepends=(python-build python-installer python-wheel)
source=("git+$url#commit=$_commit")
b2sums=('SKIP')

prepare() {
    cd $_name
    git submodule update --init --recursive
}

build() {
    cd $_name
    python -m build --wheel --no-isolation
}

package() {
    cd $_name
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
