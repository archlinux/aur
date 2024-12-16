# Maintainer: Daniel Bershatsky <bepshatsky@yandex.ru>

pkgname=python-wandb
_pkgname=${pkgname#python-}
pkgver=0.19.1
pkgrel=1
pkgdesc='A tool for visualizing and tracking your machine learning experiments'
arch=('any')
url='https://wandb.ai'
license=('MIT')
options=(!lto)
depends=(
    'python-click'
    'python-docker-pycreds'
    'python-gitpython'
    'python-platformdirs'
    'python-protobuf'
    'python-psutil'
    'python-pydantic'
    'python-requests'
    'python-sentry_sdk'
    'python-setproctitle'
    'python-setuptools'
    'python-yaml'
)
makedepends=('cargo' 'gcc' 'go' 'python-build' 'python-hatchling'
             'python-wheel')
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
sha256sums=('c6a1e477b778f77d6c81ef8607fbd54fad5d8ce1b447a79b483ca090b9d926fe')

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
