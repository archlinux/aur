# Maintainer: Michael Schubert <mschu.dev at gmail>
# Contributor: alienzj <alienchuj@gmail.com>
pkgname=python-datrie
_pkgname=datrie
pkgver=0.8.2
pkgrel=2
pkgdesc="Fast, efficiently stored Trie for Python. Uses libdatrie"
arch=('x86_64')
url="https://github.com/pytries/datrie"
license=('LGPL')
depends=('libdatrie')
makedepends=('python-setuptools' 'cython')
checkdepends=('python-pytest-runner' 'python-hypothesis')
options=(!emptydirs)
source=($_pkgname-$pkgver.tar.gz::https://github.com/pytries/datrie/archive/$pkgver.tar.gz)
sha256sums=('79d9a2960749903d632812fcc0edd09d991774933c8c332b8a82b70097721923')

prepare() {
  cd "$srcdir"/$_pkgname-$pkgver
  sed -i 's|../libdatrie/||g' src/cdatrie.pxd src/datrie.pyx
}

build() {
  cd "$srcdir"/$_pkgname-$pkgver
  ./update_c.sh
  python setup.py build
}

check() {
  cd "$srcdir"/$_pkgname-$pkgver
  python setup.py pytest
}

package() {
  cd "$srcdir"/$_pkgname-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
