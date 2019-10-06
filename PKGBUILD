# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: mutantmonkey <aur@mutantmonkey.in>

pkgbase=python-amqp
pkgname=('python-amqp' 'python2-amqp')
pkgver=2.5.2
pkgrel=1
pkgdesc="Low-level AMQP client for Python (fork of amqplib)"
arch=('any')
url="https://github.com/celery/py-amqp"
license=('LGPL')
makedepends=('python-vine' 'python2-vine')
checkdepends=('python-case' 'python2-case' 'python-pytest-sugar' 'python2-pytest-sugar')
source=("$pkgbase-$pkgver.tar.gz::https://github.com/celery/py-amqp/archive/$pkgver.tar.gz")
sha512sums=('dfdc337552a0db86a717b1b2a1139eefb4c63c8204ead5e103edd32ffdcdbdfbb4f936acf02eb1cc1d7ff53cbfaa244e795772908e3845e6a2349e4888cc94dd')

build() {
  cd py-amqp-$pkgver
  python setup.py build
  python2 setup.py build
}

check() {
  cd py-amqp-$pkgver
  pytest
  pytest2
}

package_python-amqp() {
  depends=('python-vine')

  cd py-amqp-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1
}

package_python2-amqp() {
  depends=('python2-vine')

  cd py-amqp-$pkgver
  python2 setup.py install --root="$pkgdir" --optimize=1
}

# vim:set ts=2 sw=2 et:
