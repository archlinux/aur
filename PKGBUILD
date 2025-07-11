#  Maintainer: crl <crl18039102576@126.com>

pkgname=python-torchrl
pkgver=0.9.0
pkgrel=1
pkgdesc="A modular, primitive-first, python-first PyTorch library for Reinforcement Learning."
url="https://github.com/pytorch/rl"
arch=(x86_64)
license=('MIT')
depends=(python python-cloudpickle python-tensordict python-numpy python-pytorch python-packaging)
makedepends=(python-wheel python-installer python-setuptools)
source=("${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('1cccf485d85d12a5cecc31cfbd2264d8a851b9b24ed253ed85805e8c385e6ab4')

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

