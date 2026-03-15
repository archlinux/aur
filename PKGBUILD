# Maintainer: Baptiste Jonglez <archlinux at bitsofnetworks dot org>

pkgname=python-oset
pkgver=0.1.3
pkgrel=14
pkgdesc="Ordered sets for Python"
arch=('any')
url="https://pypi.org/project/oset/"
license=('BSD')
makedepends=('python-setuptools')
source=(
  "https://pypi.io/packages/source/o/oset/oset-$pkgver.tar.gz"
  'python310_and_above_compat.patch'
)
sha256sums=(
  '4c1fd7dec96eeff9d3260995a8e37f9f415d0bdb79975f57824e68716ac8f904'
  'e2376823ab6f393fd25c0124850c453e15efc54cd6e77b95e81e12b301764320'
)

prepare() {
  cd "$srcdir/oset-$pkgver"
  patch -i "$srcdir/python310_and_above_compat.patch" -p1
}

build() {
  cd "$srcdir/oset-$pkgver"
  python setup.py build
}

check() {
  cd "$srcdir/oset-$pkgver"
  # The distribution is missing `pyoset.txt`, so we can't run
  # the testsuite provided in `src/oset/tests.py`… But we can
  # at least make sure the implementation can be imported.
  python ./src/oset/pyoset.py
}

package() {
  cd "$srcdir/oset-$pkgver"
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
  install -Dm644 LICENSE.rst "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
