# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: mutantmonkey <aur@mutantmonkey.in>

pkgbase=python-amqp
pkgname=('python-amqp' 'python2-amqp')
pkgver=2.3.1
pkgrel=1
pkgdesc="Low-level AMQP client for Python (fork of amqplib)"
arch=('any')
url="https://github.com/celery/py-amqp"
license=('LGPL')
makedepends=('python-vine' 'python2-vine')
checkdepends=('python-pytest-runner' 'python2-pytest-runner')
source=("$pkgbase-$pkgver.tar.gz::https://github.com/celery/py-amqp/archive/v$pkgver.tar.gz")
sha512sums=('17a428e7de8a2383fbedd9d56a9870ca2ce6de7b43c6ad024b27e3c6c6724a0c8d6e4fe8fcfcf9283af0e294e567c913d805a3c8fd64649be8cc9e7e509a5ef5')

prepare() {
  cp -a py-amqp-$pkgver{,-py2}
}

build() {
  cd "$srcdir"/py-amqp-$pkgver
  python setup.py build

  cd "$srcdir"/py-amqp-$pkgver-py2
  python2 setup.py build
}

check() {
  cd "$srcdir"/py-amqp-$pkgver
  python setup.py pytest

  cd "$srcdir"/py-amqp-$pkgver-py2
  python2 setup.py pytest
}

package_python-amqp() {
  depends=('python-vine')

  cd py-amqp-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1
}

package_python2-amqp() {
  depends=('python2-vine')

  cd py-amqp-$pkgver-py2
  python2 setup.py install --root="$pkgdir" --optimize=1
}

# vim:set ts=2 sw=2 et:
