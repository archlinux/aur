# Maintainer: Danilo J. S. Bellini <danilo dot bellini at gmail dot com>
# Contributor: Alexandr Parkhomenko <it@52tour.ru>
_name=numpy-financial
pkgname=("python-$_name")
pkgver=1.0.0
pkgrel=1
pkgdesc='Collection of elementary financial functions'
arch=('any')
url="https://github.com/numpy/$_name"
license=('BSD-3-Clause')
checkdepends=('python-pytest')
makedepends=('python-setuptools')
depends=('python-numpy')
options=(!emptydirs)
sha256sums=('a764c7722a34aaabff9d41208ad4e57913e615b7666528c0101d46ed97ae7f2e')
source=("$_name-v$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")

build() {
  cd "$srcdir/$_name-$pkgver"
  python setup.py build
}

check() {
  cd "$srcdir/$_name-$pkgver"
  python -m pytest
}

package() {
  cd "$srcdir/$_name-$pkgver"
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
  install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
