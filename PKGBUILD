# Maintainer: Marco Rubin <marco.rubin@protonmail.com>
# Contributor: Stella <jens300304@gmail.com>

_name=slider
pkgname=python-$_name
pkgver=0.8.0
pkgrel=2
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
conflicts=($pkgname-git)
source=("$url/archive/v$pkgver.tar.gz")
b2sums=('aabe931dca8b99a7dcbe40412a803f4394aa458ee51dab8db52e3f712a9b6bd23d67bcd25113b2eeb088f5724ae7a99c64eb99061b7194e6b310168da9b1e1f5')

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

