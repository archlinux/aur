# Maintainer: Baptiste Jonglez <archlinux at bitsofnetworks dot org>

pkgbase=python-oset
pkgname=(python-oset python2-oset)
pkgver=0.1.3
pkgrel=2
pkgdesc="Ordered sets for Python"
arch=('any')
url="https://pypi.org/project/oset/"
license=('BSD')
makedepends=('python-setuptools' 'python2-setuptools')
source=("https://pypi.io/packages/source/o/oset/oset-$pkgver.tar.gz")
sha256sums=('4c1fd7dec96eeff9d3260995a8e37f9f415d0bdb79975f57824e68716ac8f904')

prepare() {
  cp -a "$srcdir"/oset-$pkgver{,-py2}
}

build() {
  cd "$srcdir/oset-$pkgver"
  python setup.py build

  cd "$srcdir/oset-$pkgver-py2"
  python2 setup.py build
}

package_python-oset() {
  cd "$srcdir/oset-$pkgver"
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
  install -Dm644 LICENSE.rst "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

package_python2-oset() {
  cd "$srcdir/oset-$pkgver-py2"
  python2 setup.py install --root="$pkgdir" --optimize=1 --skip-build
  install -Dm644 LICENSE.rst "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
