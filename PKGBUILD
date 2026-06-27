# Contributor: pumpkincheshire <me at pumpkincheshire dot com>

pkgname="python-amazon.ion"
pkgver=0.14.6
pkgrel=1
pkgdesc='A Python implementation of Amazon Ion'
url='https://amzn.github.io/ion-docs/'
arch=('x86_64')
license=('Apache-2.0')
depends=('python')
makedepends=(
    'cmake'
    'git'
    'python-build'
    'python-installer'
    'python-wheel'
    'python-py-build-cmake' # AUR
)
source=("git+https://github.com/amazon-ion/ion-python.git#tag=v$pkgver"
        "git+https://github.com/amazon-ion/ion-c.git")
b2sums=('36e2168dcde79b2b3443a2afff745d343523dc2aea6cdc1cf644ea727edd5070740cfc011a6bd5372d8db5a2cee8e2529114d56a67e22f845881125d1ef7c78b'
        'SKIP')

prepare() {
    cd ion-python
    git submodule init
    git config submodule.ion-c.url "$srcdir/ion-c"
    git -c protocol.file.allow=always submodule update src/ion-c
}

build() {
    cd ion-python
    python -m build --wheel --no-isolation
}

package() {
    cd ion-python
    python -m installer --destdir="$pkgdir" dist/*.whl
}

# vim: set ts=4 sw=4 et:
