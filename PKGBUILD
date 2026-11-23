# Maintainer: Amin Vakil <info AT aminvakil DOT com>

pkgname=python-spotipyfree
_name=${pkgname#python-}
pkgver=1.9.15
pkgrel=1
pkgdesc="A Spotipy-compatible wrapper using SpotAPI"
arch=('any')
url="https://pypi.org/project/spotipyFree/"
license=('MIT')
depends=('python' 'python-pymongo' 'python-spotapi')
makedepends=('python-build' 'python-installer' 'python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
sha512sums=('296d1fa46bc9c59c73c94a51c466495131a0bc753d48971d450bcea972a86fcd54dc860b3239fb2f637b64b542ee88a34019d8f53f2303d0922707e4aa2fa93a')

build() {
  cd "$_name-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "$_name-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
