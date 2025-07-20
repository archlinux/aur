#  Maintainer: crl <crl18039102576@126.com>

pkgname=python-torchrl
pkgver=0.9.2
pkgrel=1
pkgdesc="A modular, primitive-first, python-first PyTorch library for Reinforcement Learning."
url="https://github.com/pytorch/rl"
arch=(x86_64)
license=('MIT')
depends=(python python-cloudpickle python-tensordict python-numpy python-pytorch python-packaging)
makedepends=(python-wheel python-installer python-setuptools gcc)
source=("${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('f6ec41227711515961d7c6457bdcaa532f053239719a624e6bd292628c129f1f')

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

