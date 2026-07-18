# Maintainer:  Anton Kudelin <kudelin at protonmail dot com>
# Contributor: Felix Golatofski <contact@xdfr.de>
# Contributor: Eduardo Parra Mazuecos <eduparra90@gmail.com>

_pkgname=pyexcel
pkgname=python-$_pkgname
pkgver=0.7.6
pkgrel=1
pkgdesc="Single API for reading, manipulating and writing data in excel files"
arch=(any)
url="https://github.com/pyexcel/pyexcel"
license=(BSD-3-Clause)
depends=(python-texttable python-pyexcel-io)
makedepends=(python-build python-installer python-setuptools python-wheel)
source=($pkgname-$pkgver.tar.gz::"$url/archive/v$pkgver.tar.gz")
sha256sums=('42c6d8e13e3c313f74ac907b31a3cb28f3d0c0c386b13621128af1915092ee76')

build() {
  cd "$srcdir/$_pkgname-$pkgver"
  python -m build \
    --wheel \
    --no-isolation \
    --skip-dependency-check
}

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  python -m installer \
    --destdir="$pkgdir" \
    --compile-bytecode=2 \
    dist/*.whl

  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
