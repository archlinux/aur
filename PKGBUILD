# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: mutantmonkey <aur@mutantmonkey.in>

pkgbase=python-amqp
pkgname=('python-amqp' 'python2-amqp')
pkgver=2.5.0
pkgrel=1
pkgdesc="Low-level AMQP client for Python (fork of amqplib)"
arch=('any')
url="https://github.com/celery/py-amqp"
license=('LGPL')
makedepends=('python-vine' 'python2-vine')
checkdepends=('python-case' 'python2-case' 'python-pytest-sugar' 'python2-pytest-sugar')
source=("$pkgbase-$pkgver.tar.gz::https://github.com/celery/py-amqp/archive/$pkgver.tar.gz")
sha512sums=('2f85a8e653e67e937b630eb2c37ea1ba6ed6f4fbbb2d9ff51c46430583c8565253c0041c242b4a91e31bdda597256fefc03de071476d9796ca6a619abd058c53')

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
