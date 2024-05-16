# Maintainer: a821 at mail de
# Contributor: Felix Yan <felixonmars@archlinux.org>

pkgname=python-editdistance
pkgver=0.8.1
pkgrel=1
pkgdesc="Fast implementation of the edit distance(Levenshtein distance)"
arch=('x86_64')
license=('MIT')
url="https://github.com/aflc/editdistance"
depends=('python')
makedepends=('cython'
             'python-build'
             'python-installer'
             'python-pdm-backend'
             'python-setuptools'
             'python-wheel')
source=("$pkgname-$pkgver.tar.gz::https://github.com/aflc/editdistance/archive/v$pkgver.tar.gz")
sha512sums=('2e8c01d6414c82ecb06f03c756938e099be2b36134705ebe302a38fea1f914a43c698c620bc6be0e9cc628b71c7c8bf8d069ea38e186945bd717e366108ddc3c')

build() {
  cd editdistance-$pkgver
  python -m build --wheel --no-isolation
}

check() {
  cd editdistance-$pkgver
  PYTHONPATH=.pdm-build python -m unittest discover test
}

package() {
  cd editdistance-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -D -m644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
