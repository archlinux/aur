# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: mutantmonkey <aur@mutantmonkey.in>

pkgbase=python-amqp
pkgname=('python-amqp' 'python2-amqp')
pkgver=2.3.0
pkgrel=1
pkgdesc="Low-level AMQP client for Python (fork of amqplib)"
arch=('any')
url="https://github.com/celery/py-amqp"
license=('LGPL')
makedepends=('python-vine' 'python2-vine')
checkdepends=('python-pytest-runner' 'python2-pytest-runner')
source=("$pkgbase-$pkgver.tar.gz::https://github.com/celery/py-amqp/archive/v$pkgver.tar.gz")
sha512sums=('6d12bd6cd7d4ca0cd756e8d434a29371f67e107c6bab602527c414ffeb650bafd163d1615afe625b08af1b144095a4ea4cf47eb68ae399887b974ff0d8614400')

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
