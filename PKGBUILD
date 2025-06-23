# Maintainer: Marco Rubin <marco.rubin@protonmail.com>
# Contributor: Stella <jens300304@gmail.com>

_name=slider
pkgname=python-$_name
pkgver=0.8.3
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
b2sums=('6c9fe08b1963e4528f31f195dd41ca7cf85da43c007da59229f867559f6ab48fadd035ab5ea388a9325abe8439b4ad05e46f00f88621acd91ff14ced235fe684')

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

