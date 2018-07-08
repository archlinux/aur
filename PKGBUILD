# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgbase=python-vine
pkgname=('python-vine' 'python2-vine')
pkgver=1.1.4
pkgrel=2
pkgdesc="Promises, promises, promises"
arch=('any')
license=('BSD')
url="https://github.com/celery/vine"
makedepends=('python-setuptools' 'python2-setuptools' 'python-case' 'python2-case')
checkdepends=('python-pytest' 'python2-pytest')
source=("$pkgbase-$pkgver.tar.gz::https://github.com/celery/vine/archive/v$pkgver.tar.gz")
sha512sums=('022aec13ae53abea8e1280c8736c2a08553ec8cdadb420a8166a3aef9f120dab5da1e1cc04569422c96c1f74c76ac1f43d4e1267094b81a250dd08d47dd99d14')

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
