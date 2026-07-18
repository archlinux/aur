# Maintainer:  Anton Kudelin <kudelin at proton dot me>
# Contributor: Eduardo Parra Mazuecos <eduparra90@gmail.com>

_pyname=pyexcel-io
pkgname=python-$_pyname
pkgver=0.6.8
pkgrel=1
pkgdesc="One interface to read and write the data in various excel formats"
arch=(any)
url="https://github.com/pyexcel/pyexcel-io"
license=(BSD-3-Clause)
depends=(python-lml)
optdepends=('python-chardet: encoding detection for zipped CSV (csvz/tsvz)')
makedepends=(python-setuptools python-build python-installer python-wheel)
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('19be62568521a31b24bb4d7d5fc456939d9b8b9a29297ec887d9e57df4c0b06e')

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

  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
