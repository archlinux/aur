# Maintainer: Daniel Bershatsky <bepshatsky@yandex.ru>

pkgname=python-wandb
_pkgname=${pkgname#python-}
pkgver=0.16.6
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
sha256sums=('938b7dd023a29282b63034d4d383939c1d0f00d3161375994f7a9d9d619bae45')

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
