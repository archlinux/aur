# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=python-python-lorem
_name=${pkgname#python-}
pkgver=1.3.0
pkgrel=1
pkgdesc="Pythonic lorem ipsum generator"
arch=('any')
url="https://github.com/JarryShaw/lorem"
license=('BSD')
depends=('python')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
checkdepends=('python-pytest')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('821cef0c9455f974a84eabbcf3f0774d71884d43352bd3cfe5df44607a10acd2')

build() {
  cd "$_name-$pkgver"
  python -m build --wheel --no-isolation
}

check() {
  cd "$_name-$pkgver"
  pytest
}

package() {
  cd "$_name-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl

  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
