# Maintainer: Nils Werner <nils.werner@gmail.com>

pkgbase=python-confight
pkgname=(python-confight python2-confight)
pkgver=1.3.1
pkgrel=1
pkgdesc='One simple way of parsing configs.'
arch=('any')
url="https://github.com/Avature/confight"
license=('MIT')
makedepends=('python-setuptools' 'python2-setuptools')
source=(
  "https://pypi.io/packages/source/c/confight/confight-$pkgver.tar.gz"
  "LICENSE.txt"
)
md5sums=(
  '286c815e2ff36d1c74382e464c5d2d6d'
  'b62f1a403a498f2bc2240d7e85eceafe'
)

prepare() {
  cp -a confight-$pkgver{,-py2}
}

build() {
  cd "$srcdir"/confight-$pkgver
  python setup.py build

  cd "$srcdir"/confight-$pkgver-py2
  python2 setup.py build
}

check() {
  cd "$srcdir"/confight-$pkgver
  python setup.py test

  cd "$srcdir"/confight-$pkgver-py2
  python2 setup.py test
}

package_python-confight() {
  depends=('python')

  install -Dm644 LICENSE.txt "$pkgdir"/usr/share/licenses/$pkgname/LICENSE.txt
  cd confight-$pkgver
  python setup.py install --root="$pkgdir/" --optimize=1
}

package_python2-confight() {
  depends=('python2')

  install -Dm644 LICENSE.txt "$pkgdir"/usr/share/licenses/$pkgname/LICENSE.txt
  cd confight-$pkgver-py2
  python2 setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
