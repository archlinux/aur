#  Maintainer: crl <crl18039102576@126.com>

pkgname=python-torchrl
pkgver=0.7.0
pkgrel=1
pkgdesc="A modular, primitive-first, python-first PyTorch library for Reinforcement Learning."
url="https://github.com/pytorch/rl"
arch=(x86_64)
license=('MIT')
depends=(python python-cloudpickle python-tensordict python-numpy python-pytorch python-packaging)
makedepends=(python-wheel python-installer python-setuptools)
source=("${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('20eb2fa499af215aa8c0cd2b4dc28e4e05050b9db68b590a6a950ba6bb8b6e61')

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

