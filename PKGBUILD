# Maintainer: Amin Vakil <info AT aminvakil DOT com>

pkgname=python-readerwriterlock
_name=${pkgname#python-}
pkgver=1.0.9
pkgrel=2
pkgdesc="A python implementation of the three Reader-Writer problems"
arch=('any')
url="https://github.com/elarivie/pyReaderWriterLock"
license=('MIT')
depends=('python' 'python-typing_extensions')
makedepends=('python-build' 'python-installer' 'python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
sha512sums=('77ac6996931a9b248d6e1ad74db7645fed7e01328f798d161b7f39ce9b319e96931739227a70148e9bc76bb467f480b27f9c03f17f2704bcef833bdf8b901f67')

build() {
  cd "$_name-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "$_name-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
