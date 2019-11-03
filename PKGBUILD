# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgbase=python-vine
pkgname=('python-vine' 'python2-vine')
pkgver=1.3.0
pkgrel=3
pkgdesc="Promises, promises, promises"
arch=('any')
license=('BSD')
url="https://github.com/celery/vine"
makedepends=('python-setuptools' 'python2-setuptools' 'python-case' 'python2-case')
checkdepends=('python-pytest' 'python2-pytest')
source=("$pkgbase-$pkgver.tar.gz::https://github.com/celery/vine/archive/v$pkgver.tar.gz")
sha512sums=('cb6ee9fcfcd7e7e23e894fce646c9e8b2300622fcc1811c1547bda90e3756de248ac01e4f812ecbb31dd1798734219d0b8f986354ae16014a7e5d949ab5d994f')

prepare() {
  cp -a vine-$pkgver{,-py2}
}

build() {
  cd "$srcdir"/vine-$pkgver
  python setup.py build

  cd "$srcdir"/vine-$pkgver-py2
  python2 setup.py build
}

check() {
  cd "$srcdir"/vine-$pkgver
  python setup.py test

  cd "$srcdir"/vine-$pkgver-py2
  python2 setup.py test
}

package_python-vine() {
  depends=('python-case')

  cd vine-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

package_python2-vine() {
  depends=('python2-case')

  cd vine-$pkgver-py2
  python2 setup.py install --root="$pkgdir" --optimize=1
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
