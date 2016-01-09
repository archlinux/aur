# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: mutantmonkey <aur@mutantmonkey.in>

pkgbase=python-amqp
pkgname=('python-amqp' 'python2-amqp')
pkgver=1.4.9
pkgrel=1
pkgdesc="Low-level AMQP client for Python (fork of amqplib)"
arch=('any')
url="http://github.com/celery/py-amqp"
license=('LGPL')
makedepends=('python-setuptools' 'python2-setuptools' 'git')
checkdepends=('python-nose' 'python2-nose' 'python-mock' 'python2-mock')
source=("https://pypi.python.org/packages/source/a/amqp/amqp-$pkgver.tar.gz")
md5sums=('df57dde763ba2dea25b3fa92dfe43c19')

prepare() {
  cp -a amqp-$pkgver{,-py2}
}

build() {
  cd "$srcdir/amqp-$pkgver"
  python setup.py build

  cd "$srcdir/amqp-$pkgver-py2"
  python2 setup.py build
}

check() {
  cd "$srcdir/amqp-$pkgver"
  nosetests3

  cd "$srcdir/amqp-$pkgver-py2"
  nosetests2
}

package_python-amqp() {
  depends=('python')

  cd amqp-$pkgver
  python setup.py install --root="$pkgdir/" --optimize=1
}

package_python2-amqp() {
  depends=('python2')

  cd amqp-$pkgver-py2
  python2 setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
