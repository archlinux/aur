# Maintainer: Amin Vakil <info AT aminvakil DOT com>

pkgname=python-spotipyfree
_name=${pkgname#python-}
pkgver=1.4.2
pkgrel=3
pkgdesc="A Spotipy-compatible wrapper using SpotAPI"
arch=('any')
url="https://pypi.org/project/spotipyFree/"
license=('MIT')
depends=('python' 'python-pymongo' 'python-spotapi')
makedepends=('python-build' 'python-installer' 'python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
sha512sums=('25d6515c01c056aa8201f13062a00e38fca2851a2e27d72fd0100f780aa84843060c800cdce6b373686a7611a6c6857cf6af675f2ebc0576d3c40e56f4fb0a8a')

build() {
  cd "$_name-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "$_name-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
