# Maintainer: a821 at mail dot de
# Contributor: pumpkincheshire <me at pumpkincheshire dot com>

pkgname="python-amazon.ion"
pkgver=0.15.0
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
b2sums=('4f1c2b4c1db8883b653be6a26ef2ca389a4467671a01400aa46dc2f6d2e24d27dffba9d98fb244be91230cdf6aed714d8d8496af6beb98862c2d444ad18b59a4'
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
