# Maintainer:  Anton Kudelin <kudelin at proton dot me>
# Contributor: Wu Junyu (aka Tenshi65535) <wu.junyu.aur@outlook.com>

_pyname=optking
pkgname=python-$_pyname
pkgver=0.3.0
pkgrel=1
pkgdesc="A molecular geometry optimization program"
arch=(any)
url="https://github.com/psi-rking/optking"
license=(BSD-3-Clause)
depends=(python-numpy python-qcelemental python-qcengine python-msgpack)
makedepends=(python-setuptools cython python-build python-installer python-wheel)
source=($pkgname-$pkgver.tar.gz::https://github.com/psi-rking/optking/archive/$pkgver.tar.gz)
sha256sums=("05aa6079f4cebef9fbe8cc36c7315123afeb53fb3feed959f98d963060e1085c")

build() {
  cd "$srcdir/$_pyname-$pkgver"
  python -m build \
    --wheel \
    --no-isolation \
    --skip-dependency-check
}

package() {
  cd "$srcdir/$_pyname-$pkgver"
  python -m installer \
    --destdir="$pkgdir" \
    --compile-bytecode=2 \
    dist/*.whl
}
