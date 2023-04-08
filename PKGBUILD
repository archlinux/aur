# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Simon Sapin <simon dot sapin at exyr dot org>
# Contributor: Kyle Keen <keenerd@gmail.com>

pkgname=python-nosexcover
pkgver=1.0.11
pkgrel=8
pkgdesc="Extends nose.plugins.cover to add Cobertura-style XML reports"
url="https://pypi.python.org/pypi/nosexcover"
license=('BSD')
arch=('any')
depends=('python-nose' 'python-coverage')
makedepends=('python-setuptools' 'python-nose' 'python-coverage')
source=("$pkgname-$pkgver.tar.gz::https://github.com/cmheisel/nose-xcover/archive/v$pkgver.tar.gz")
sha512sums=('e606e89b75d51c728d1487200f4a38afe1af93defabe6bd847b80d597374e7bb10abc2e5c8e6778bbd4f17ba8b8d7a601864a8277cd14437ee94a9e04996cf22')

build() {
  cd "$srcdir"/nose-xcover-$pkgver
  python setup.py build
}

check() {
  cd "$srcdir"/nose-xcover-$pkgver
  nosetests3 -v nosexcover/tests.py
}

package() {
  cd nose-xcover-$pkgver
  python3 setup.py install --root="$pkgdir" --optimize=1
  install -D -m644 LICENSE.txt "$pkgdir"/usr/share/licenses/$pkgname/LICENSE.txt
}
