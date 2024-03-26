# Maintainer: acxz <akashpatel2008@yahoo.com>
# Contributor: Tong Chunli<t.cunly at 163 dot com>

pkgname=python-colcon-core
pkgver=0.16.0
pkgrel=1
pkgdesc="Command line tool to build sets of software packages."
arch=(any)
url="https://colcon.readthedocs.io/en/released/"
license=('Apache')
depends=(
    python-pytest
    python-pytest-runner
    python-pytest-rerunfailures
    python-pytest-repeat
    python-coverage
    python-pytest-cov
    python-distlib
    python-notify2
    python-empy3
)
makedepends=(
    python-setuptools
    python-build
    python-installer
    python-wheel
)
source=("$pkgname-$pkgver.tar.gz"::"https://github.com/colcon/colcon-core/archive/$pkgver.tar.gz")
sha256sums=('223e3096b75e4c1537861a0d95585ce8306a7d3ac796c0944658d932eca15539')

_pkgname=colcon-core

build() {
    cd "$_pkgname-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd ${srcdir}/${_pkgname}-${pkgver}
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -D -m644 README.rst -t "$pkgdir/usr/share/doc/$pkgname"
}
