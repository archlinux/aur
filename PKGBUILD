# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-editdistance
pkgver=0.6.2
pkgrel=2
pkgdesc="Fast implementation of the edit distance(Levenshtein distance)"
arch=('x86_64')
license=('MIT')
url="https://github.com/aflc/editdistance"
depends=('python')
makedepends=('python-setuptools' 'cython')
checkdepends=('python-nose')
source=("$pkgname-$pkgver.tar.gz::https://github.com/aflc/editdistance/archive/v$pkgver.tar.gz"
        LICENSE)
sha512sums=('8d44d310351c688180fb783d87922a954427618793fa6d15e1d231b4cf0efafd9ecfdfbbcf4453021ad189870d01eb72ea3ba4de57f333ffbb157bb4b8529cd2'
            '590232c1e7fa5aaaaa77573c4ea23533522177ca0ac07a0ce7f00e446d47467df2e19936ecb5e057fddc664d1daca39e2217cb5f6e3192ef5edf49b1f73e0f10')

build() {
  cd editdistance-$pkgver
  python setup.py build
}

check() {
  cd editdistance-$pkgver
  python setup.py nosetests
}

package() {
  cd editdistance-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1
  install -D -m644 ../LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
