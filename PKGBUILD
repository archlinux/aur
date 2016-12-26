# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgbase=python-vine
pkgname=('python-vine' 'python2-vine')
pkgver=1.1.3
pkgrel=2
pkgdesc="Promises, promises, promises"
arch=('any')
license=('BSD')
url="https://github.com/celery/vine"
makedepends=('python-setuptools' 'python2-setuptools' 'python-case' 'python2-case' 'git')
checkdepends=('python-pytest' 'python2-pytest')
source=("git+https://github.com/celery/vine.git#tag=v$pkgver")
sha512sums=('SKIP')

prepare() {
  cp -a vine{,-py2}
}

build() {
  cd "$srcdir"/vine
  python setup.py build

  cd "$srcdir"/vine-py2
  python2 setup.py build
}

check() {
  cd "$srcdir"/vine
  python setup.py test

  cd "$srcdir"/vine-py2
  python2 setup.py test
}

package_python-vine() {
  depends=('python-case')

  cd vine
  python setup.py install --root="$pkgdir" --optimize=1
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

package_python2-vine() {
  depends=('python2-case')

  cd vine-py2
  python2 setup.py install --root="$pkgdir" --optimize=1
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
