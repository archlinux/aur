# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgbase=python-colander
pkgname=(python-colander python2-colander)
pkgver=1.5.1
pkgrel=1
pkgdesc="A simple schema-based serialization and deserialization library"
url="https://docs.pylonsproject.org/projects/colander/en/latest/"
license=('BSD')
arch=('x86_64')
makedepends=('python-setuptools' 'python2-setuptools' 'python-translationstring'
             'python2-translationstring' 'python-iso8601' 'python2-iso8601' 'python2-enum34')
checkdepends=('python-nose' 'python2-nose')
source=("$pkgbase-$pkgver.tar.gz::https://github.com/Pylons/colander/archive/$pkgver.tar.gz")
sha512sums=('cb9aa9ddacc3a3bd92aadb260742d85c91419f802c0e0dbd36ed074b8611314fc02d62f73672952c117b5569304794359b49006fb552caf1625846684b154761')

build() {
  cd colander-$pkgver
  python setup.py build
  python2 setup.py build
}

check() {
  cd colander-$pkgver
  python setup.py nosetests
  python2 setup.py nosetests
}

package_python-colander() {
  depends=('python-translationstring' 'python-iso8601')

  cd colander-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1

  install -Dm644 LICENSE.txt "$pkgdir"/usr/share/licenses/$pkgname/LICENSE.txt
}

package_python2-colander() {
  depends=('python2-translationstring' 'python2-iso8601' 'python2-enum34')

  cd colander-$pkgver
  python2 setup.py install --root="$pkgdir" --optimize=1

  install -Dm644 LICENSE.txt "$pkgdir"/usr/share/licenses/$pkgname/LICENSE.txt
}
