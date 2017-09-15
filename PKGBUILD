# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: mutantmonkey <aur@mutantmonkey.in>

pkgbase=python-amqp
pkgname=('python-amqp' 'python2-amqp')
pkgver=2.2.2
pkgrel=1
pkgdesc="Low-level AMQP client for Python (fork of amqplib)"
arch=('any')
url="https://github.com/celery/py-amqp"
license=('LGPL')
makedepends=('python-vine' 'python2-vine')
checkdepends=('python-pytest-runner' 'python2-pytest-runner')
source=("$pkgbase-$pkgver.tar.gz::https://github.com/celery/py-amqp/archive/v$pkgver.tar.gz")
sha512sums=('62f60236da9c9a38cc0e63bf08cb52f940c62350fbe1b6dc690e008b61637294541893392470f9a1839cc8bcb6d27a6608c028ec9a23b198936b3a37d6b0d234')

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
