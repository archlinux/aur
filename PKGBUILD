# Maintainer: Daniel Bershatsky <bepshatsky@yandex.ru>

pkgname=python-wandb
_pkgname=${pkgname#python-}
pkgver=0.17.1
pkgrel=1
pkgdesc='A tool for visualizing and tracking your machine learning experiments'
arch=('any')
url='https://wandb.ai'
license=('MIT')
depends=(
    'python-click'
    'python-docker-pycreds'
    'python-gitpython'
    'python-platformdirs'
    'python-protobuf'
    'python-psutil'
    'python-requests'
    'python-sentry_sdk'
    'python-setproctitle'
    'python-setuptools'
    'python-yaml'
)
makedepends=('gcc' 'go' 'python-build' 'python-hatchling' 'python-wheel')
optdepends=(
    'python-moviepy: logging videos'
    'python-numpy: logging multi-dimensional arrays'
    'python-pillow: logging images'
    'python-rdkit: logging cheminformatical data'
    'python-soundfile: logging audios'
)
provides=('python-wandb')
conflicts=('python-wandb-git')
source=("$pkgname-$pkgver.tar.gz::https://github.com/wandb/wandb/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('70e22c75b313c8a32533c915353e4062dd67f338b50f27650d0a569f05f8b62a')

build() {
    cd "$_pkgname-$pkgver"
    python -m build -nw
}

check() {
    cd "$_pkgname-$pkgver"
    PYTHONPATH=$PWD python -c 'import wandb'
}

package() {
    python -m installer \
        --compile-bytecode=1 \
        --destdir=$pkgdir \
        $srcdir/$_pkgname-$pkgver/dist/$_pkgname-$pkgver-*.whl
}
