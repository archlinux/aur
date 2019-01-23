# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: mutantmonkey <aur@mutantmonkey.in>

pkgbase=python-amqp
pkgname=('python-amqp' 'python2-amqp')
pkgver=2.4.0
pkgrel=1
pkgdesc="Low-level AMQP client for Python (fork of amqplib)"
arch=('any')
url="https://github.com/celery/py-amqp"
license=('LGPL')
makedepends=('python-vine' 'python2-vine')
checkdepends=('python-case' 'python2-case' 'python-pytest-sugar' 'python2-pytest-sugar')
source=("$pkgbase-$pkgver.tar.gz::https://github.com/celery/py-amqp/archive/v$pkgver.tar.gz"
        https://github.com/celery/py-amqp/pull/236.patch)
sha512sums=('74c4f1dd938eaed72212ef7fee213a80a7277972870bf0cb8eee5940e62b8a428712c08e64c78b0a2158545bc49240ac34c288e1943cbdd8e5e182b1c4f4e0d7'
            '64c4f7c7678601fe18af134fcf1f5b2244278e41317d6079ff5572e28c266fbbe394eae3c48bde2b05de8e0cfe3305beebe33cfed409285ff8dbcedf42b270fa')

prepare() {
  patch -d py-amqp-$pkgver -p1 -i ../236.patch
}

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
