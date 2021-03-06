pkgname=python-construct-288
pkgver=2.8.8
pkgrel=1
pkgdesc="A powerful declarative parser/builder for binary data"
arch=('any')
license=('MIT')
url="https://construct.readthedocs.org/"
depends=('python')
conflicts=('python-construct')
provides=("python-construct=$pkgver-$pkgrel")
makedepends=('python-setuptools' 'git')
checkdepends=('python-pytest' 'python-numpy')
source=("$pkgname-$pkgver.tar.gz::https://github.com/construct/construct/archive/v$pkgver.tar.gz")
sha512sums=('6c6e695f677d6eec11668131bc248d4a6bc1a9efca0a5cd5519212bf9ab5c1944153be95ae99070ccb96a52aa24db2c3ca123d71afccc875b1965fbe0884177e')

build() {
  cd construct-$pkgver
  python setup.py build
}

check() {
  cd construct-$pkgver
  PYTHONPATH="$PWD" py.test
}

package() {
  cd construct-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1
  install -D -m644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
