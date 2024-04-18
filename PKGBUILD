# Maintainer: Daniel Bershatsky <bepshatsky@yandex.ru>

pkgname=python-wandb
_pkgname=${pkgname#python-}
pkgver=0.16.5
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
sha256sums=('ae719512da9c40f1bfbd992bffd255486df8e2c45f5108cb5a50af196dd56928')

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
