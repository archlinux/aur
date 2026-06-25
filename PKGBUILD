# Contributor: pumpkincheshire <me at pumpkincheshire dot com>

pkgname="python-amazon.ion"
pkgver=0.14.4
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
b2sums=('07a5238d005f54cc8f4d94a77c9ef00e11fc8683b7871e42ac7bafce83416ac50ee2349534d3e923e2a342942a961614c2a747897e60559e8bb2d67cc133f6dc'
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
