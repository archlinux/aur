# Maintainer:

pkgname=python38-autopage
pkgver=0.5.1
pkgrel=1
pkgdesc='A library to provide automatic paging for console output'
arch=(any)
url='https://github.com/zaneb/autopage'
license=(Apache)
depends=(python38)
checkdepends=(python38-pytest python38-fixtures)
makedepends=(python38-build python38-installer python38-setuptools python38-wheel)
source=(https://pypi.python.org/packages/source/a/autopage/autopage-$pkgver.tar.gz)
sha512sums=('d2db8091bfdb209319ed8f06cea86abdc33e8ea338290d3a6f99341d78d8a9f079021c21c18c9ee7032f13496ed0d3bfe5a96465473fc747da984452d26c0382')

build() {
  cd autopage-$pkgver
  python3.8 -m build --wheel --skip-dependency-check --no-isolation
}

check() {
  cd autopage-$pkgver
  unset LESS PAGER
  pytest -v -k 'not test_end_to_end.py'
}

package() {
  cd autopage-$pkgver
  python3.8 -m installer --destdir="$pkgdir" dist/*.whl
}
