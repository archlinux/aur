# Maintainer: Marco Rubin <marco.rubin@protonmail.com>
# Contributor: Stella <jens300304@gmail.com>

_name=slider
pkgname=python-$_name
pkgver=0.8.1
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
b2sums=('f0c79c4c5dc91734268dff22781f605af46fb46b832e1ccacf54c51f7698385fac89ad5906e5b91e057381823938f24d418fa01df6cc7385f6fba14d6c1ae348')

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

