#  Maintainer: crl <crl18039102576@126.com>

pkgname=python-torchrl
pkgver=0.10.0
pkgrel=1
pkgdesc="A modular, primitive-first, python-first PyTorch library for Reinforcement Learning."
url="https://github.com/pytorch/rl"
arch=(x86_64)
license=('MIT')
depends=(python python-cloudpickle python-tensordict python-numpy python-pytorch python-packaging)
makedepends=(python-wheel python-installer python-setuptools gcc)
source=("${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('5f255a696ddb658421d6ce3045893d8d49b20f48c0e55f6d24d42f4a3800a9da')

build() {
    cd rl-$pkgver
    export CXXFLAGS="$CXXFLAGS -DGLOG_USE_GLOG_EXPORT"
    export CFLAGS="$CFLAGS -DGLOG_USE_GLOG_EXPORT"
    python -m build --wheel --no-isolation --skip-dependency-check
}

package() {
    cd rl-$pkgver
    python -m installer --destdir="$pkgdir" dist/*.whl
}

