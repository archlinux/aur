# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: fenuks

pkgname=python-fuzzywuzzy
pkgver=0.18.0
pkgrel=6
pkgdesc="Fuzzy string matching like a boss"
arch=("any")
url="https://pypi.python.org/pypi/fuzzywuzzy"
license=('GPL2')
depends=('python')
optdepends=('python-levenshtein: provides a 4-10x speedup in string matching')
makedepends=('python-setuptools')
checkdepends=('python-pytest' 'python-hypothesis' 'python-levenshtein' 'python-pycodestyle')
source=("https://github.com/seatgeek/fuzzywuzzy/archive/$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('26795bd6c319a8c789d62ecbe95e29a97711f0176d3beea04ce510981095f696')

build() {
  cd fuzzywuzzy-$pkgver
  python setup.py build
}

check() {
  cd fuzzywuzzy-$pkgver
  # https://github.com/seatgeek/fuzzywuzzy/issues/284
  pytest --deselect test_fuzzywuzzy_pytest.py::test_process_warning
}

package() {
  cd fuzzywuzzy-$pkgver
  python setup.py install --root="$pkgdir/" --optimize=1
}
