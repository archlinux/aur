# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: mutantmonkey <aur@mutantmonkey.in>

pkgbase=python-amqp
pkgname=('python-amqp' 'python2-amqp')
pkgver=2.3.2
pkgrel=2
pkgdesc="Low-level AMQP client for Python (fork of amqplib)"
arch=('any')
url="https://github.com/celery/py-amqp"
license=('LGPL')
makedepends=('python-vine' 'python2-vine')
checkdepends=('python-pytest-runner' 'python2-pytest-runner')
source=("$pkgbase-$pkgver.tar.gz::https://github.com/celery/py-amqp/archive/v$pkgver.tar.gz")
sha512sums=('c0de912d0ec83a9c42c97c1fc950513605d978e6b56bfabe133dc6e03e27e18bf0f353593e1185be4538f78890c0dcb1e22334dbbb955aa8f2dbccf64efa56a6')

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
