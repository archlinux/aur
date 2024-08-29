# Maintainer: Daniel Bershatsky <bepshatsky@yandex.ru>

pkgname=python-wandb
_pkgname=${pkgname#python-}
pkgver=0.17.8
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
install="python-wandb.install"
source=("$pkgname-$pkgver.tar.gz::https://github.com/wandb/wandb/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('d14a4ce129b14043a199eacefceb36c7f8537f5cade75fd372006e8549e8db92')

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
