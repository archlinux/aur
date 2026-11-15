# Maintainer: a821 at mail dot de
# Contributor: pumpkincheshire <me at pumpkincheshire dot com>

pkgname="python-amazon.ion"
pkgver=0.16.0
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
b2sums=('efa3b171f84632c765562223dacdc13486890c1c5c408f04428897835433ef8a4598ed6bf2d6e4fceb8614613e2778259d94e61f30acc5c0d5e9ef4a29a3ce17'
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
