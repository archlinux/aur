pkgname=python-ostruct
_pyname=${pkgname#python-}
makedepends=(python-build python-installer python-setuptools python-wheel)
checkdepends=(python-pytest)
pkgver=4.0.1
pkgrel=1
pkgdesc='OpenStruct for Python'
arch=(any)
url=https://github.com/hamidnazari/python-ostruct
license=(MIT)
source=(https://files.pythonhosted.org/packages/source/${_pyname::1}/$_pyname/$_pyname-$pkgver.tar.gz)
sha512sums=('15ce33844e042e7fa2c749acfddeabf71d552d5d55cc8205628c74397b50cc0117aa41d25006661f5ec30ad84b8c584dae7409ac5afad0567216ddf094562e35')

build() {
  cd "$srcdir/$_pyname-$pkgver"
  python -m build --wheel --no-isolation
}

check() {
  cd "$srcdir/$_pyname-$pkgver"
  pytest
}

package_python-ostruct() {
  depends=(python)
  cd "$srcdir/$_pyname-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm 644 README.md "$pkgdir/usr/share/doc/$pkgname/README"
}
