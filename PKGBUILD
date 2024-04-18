# Maintainer: Daniel Bershatsky <bepshatsky@yandex.ru>

pkgname=python-wandb
_pkgname=${pkgname#python-}
pkgver=0.16.3
pkgrel=1
pkgdesc='A tool for visualizing and tracking your machine learning experiments'
arch=('any')
url='https://wandb.ai'
license=('MIT')
depends=(
    'python-appdirs'
    'python-click'
    'python-docker-pycreds'
    'python-gitpython'
    'python-protobuf'
    'python-psutil'
    'python-pyaml'
    'python-requests'
    'python-sentry_sdk'
    'python-setproctitle'
)
makedepends=('python-build' 'python-installer' 'python-setuptools'
             'python-wheel')
provides=('python-wandb')
conflicts=('python-wandb-git')
source=("$pkgname-$pkgver.tar.gz::https://github.com/wandb/wandb/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('afe98f23531e9eaffd03a43eefd8570f4abd092fcee1090281b223f6b1833b6c')

build() {
    cd "$_pkgname-$pkgver"
    python -m build -nw
}

package() {
    python -m installer \
        --compile-bytecode=1 \
        --destdir=$pkgdir \
        $srcdir/$_pkgname-$pkgver/dist/$_pkgname-$pkgver-*.whl
}
