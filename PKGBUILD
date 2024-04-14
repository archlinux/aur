# Maintainer: Marco Rubin <marco.rubin@protonmail.com>
# Contributor: Stella <jens300304@gmail.com>

_name=slider
pkgname=python-$_name
pkgver=0.8.2
pkgrel=1
pkgdesc="Utilities for working with osu! files and data."
arch=(any)
url="https://github.com/llllllllll/slider"
license=('LGPL3')
depends=(
    'python>=3.6'
    'python-click'
    'python-numpy'
    'python-requests'
    'python-scipy'
)
makedepends=(python-build python-installer python-setuptools python-wheel)
checkdepends=(python-pytest)
source=("$url/archive/v$pkgver.tar.gz")
b2sums=('752be266514e478d80deec723c451a066537592690700f271e9c53e1bfc1b32741e378b97635c5c11eeaf23338d85ee0b3c82aa69289be99ecc60b61ef60131a')

# prepare() {
#     cd $_name-$pkgver
#     rm setup.py
#     cp ../../pyproject.toml .
#     cp ../../beatmaps.py slider/example_data/beatmaps/__init__.py
#     cp ../../collections.py slider/example_data/collections/__init__.py
# }

build() {
    cd $_name-$pkgver
    python -m build --wheel --no-isolation
}

check() {
    cd $_name-$pkgver
    pytest
}

package() {
    cd $_name-$pkgver
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

