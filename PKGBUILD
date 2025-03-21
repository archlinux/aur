# Maintainer: Anton Kudelin <kudelin at proton dot me>
# Contributor: Eduardo Parra Mazuecos <eduparra90@gmail.com>

_pyname=lml
pkgname=python-$_pyname
pkgver=0.2.0
pkgrel=1
pkgdesc="A lazy loading plugin management system."
arch=(any)
url='https://github.com/python-lml/lml'
license=(BSD-3-Clause)
depends=(python)
makedepends=(python-setuptools cython python-build python-installer python-wheel)
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('e34afa915ea71e935687356376f5303386ea69a6e9de4bde612466e1ec5f16a7')

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
