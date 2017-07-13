# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: mutantmonkey <aur@mutantmonkey.in>

pkgbase=python-amqp
pkgname=('python-amqp' 'python2-amqp')
pkgver=2.2.0
pkgrel=1
pkgdesc="Low-level AMQP client for Python (fork of amqplib)"
arch=('any')
url="http://github.com/celery/py-amqp"
license=('LGPL')
makedepends=('python-vine' 'python2-vine')
checkdepends=('python-pytest-runner' 'python2-pytest-runner')
source=("$pkgbase-$pkgver.tar.gz::https://github.com/celery/py-amqp/archive/v$pkgver.tar.gz")
sha512sums=('dce482c19ae736ec233a820db77898f99e321288f54ba5b1166011063405b291de4327b8737ac0e261eeb3eed6fab5ddd3fc46bc5612e11d1dfbb6751a4fcbab')

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
  python setup.py ptr

  cd "$srcdir"/py-amqp-$pkgver-py2
  python2 setup.py ptr
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
