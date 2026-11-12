# Maintainer: Amin Vakil <info AT aminvakil DOT com>

pkgname=python-spotipyfree
_name=${pkgname#python-}
pkgver=1.9.14
pkgrel=1
pkgdesc="A Spotipy-compatible wrapper using SpotAPI"
arch=('any')
url="https://pypi.org/project/spotipyFree/"
license=('MIT')
depends=('python' 'python-pymongo' 'python-spotapi')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
sha512sums=('8664c603c63b0f13eebd70580e467655eac1d1dfcd6b686e6c70e3741962cbd33e98be528716b88147b867112d121710fd8f452b43d58f004ef1a704310e7561')

build() {
  cd "$_name-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "$_name-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
