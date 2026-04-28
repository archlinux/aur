#  Maintainer: crl <crl18039102576@126.com>

pkgname=python-torchrl
pkgver=0.12.0
pkgrel=1
pkgdesc="A modular, primitive-first, python-first PyTorch library for Reinforcement Learning."
url="https://github.com/pytorch/rl"
arch=(x86_64)
license=('MIT')
depends=(python python-cloudpickle python-tensordict python-numpy python-pytorch python-packaging)
makedepends=(python-wheel python-installer python-setuptools gcc)
source=("${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('04a53fddc8c41a3d0da5ebc3601d205c24d747858b44dba527ae63147844157d')

build() {
    cd rl-$pkgver
    export CXXFLAGS="$CXXFLAGS -DGLOG_USE_GLOG_EXPORT"
    export CFLAGS="$CFLAGS -DGLOG_USE_GLOG_EXPORT"
    python -m build --wheel --no-isolation --skip-dependency-check
}

package() {
    cd rl-$pkgver
    python -m installer --destdir="$pkgdir" dist/*.whl
    
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

