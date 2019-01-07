# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgbase=python-vine
pkgname=('python-vine' 'python2-vine')
pkgver=1.2.0
pkgrel=1
pkgdesc="Promises, promises, promises"
arch=('any')
license=('BSD')
url="https://github.com/celery/vine"
makedepends=('python-setuptools' 'python2-setuptools' 'python-case' 'python2-case')
checkdepends=('python-pytest' 'python2-pytest')
source=("$pkgbase-$pkgver.tar.gz::https://github.com/celery/vine/archive/v$pkgver.tar.gz")
sha512sums=('7b80d268bac6915ed30f9f25382b2a22534a9a182a88092b651abb94e95ec740aa2465cd13488f16c3636e3ee51b77fdef7f79a8f5a72e93964d3a72d5fe3e3c')

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
