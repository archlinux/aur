# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Daniel M. Capella <polyzen@archlinux.org>

pkgname=python-contexter
pkgver=0.1.4
pkgrel=3
pkgdesc='Full replacement of the contextlib standard library module'
arch=('any')
url=https://bitbucket.org/defnull/contexter
license=('MIT')
depends=('python')
makedepends=('python-setuptools' 'python-build' 'python-installer' 'python-wheel')
source=("$pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/c/contexter/contexter-$pkgver.tar.gz"
        '001-setup.py.patch'
        'LICENSE')
sha256sums=('c730890b1a915051414a6350d8ea1cddca7d01d8f756badedb30b9bf305ea0a8'
            'dab8e575ca79aedfe49afe7e6d78f92c6d21c7321ae408db1ae2c63ba8154827'
            'de6c16a58caef8f4cf4c3473c9308d1ddb2d029b8a31f73cb5a944f486f05343')

prepare() {
  patch -p1 -d "contexter-$pkgver" < 001-setup.py.patch
}

build() {
  cd "contexter-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  export PYTHONHASHSEED=0
  cd "contexter-$pkgver"
  python -m installer --destdir="$pkgdir/" dist/*.whl
  install -Dm644 "$srcdir/LICENSE" -t "$pkgdir/usr/share/licenses/$pkgname/"
}

# vim:set ts=2 sw=2 et:
