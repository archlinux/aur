# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: mutantmonkey <aur@mutantmonkey.in>

pkgbase=python-amqp
pkgname=('python-amqp' 'python2-amqp')
pkgver=2.1.3
pkgrel=1
pkgdesc="Low-level AMQP client for Python (fork of amqplib)"
arch=('any')
url="http://github.com/celery/py-amqp"
license=('LGPL')
makedepends=('python-vine' 'python2-vine' 'git')
checkdepends=('python-pytest-runner' 'python2-pytest-runner')
source=("git+https://github.com/celery/py-amqp.git#tag=v$pkgver")
md5sums=('SKIP')

prepare() {
  cp -a py-amqp{,-py2}
}

build() {
  cd "$srcdir"/py-amqp
  python setup.py build

  cd "$srcdir"/py-amqp-py2
  python2 setup.py build
}

check() {
  cd "$srcdir"/py-amqp
  python setup.py ptr

  cd "$srcdir"/py-amqp-py2
  python2 setup.py ptr
}

package_python-amqp() {
  depends=('python-vine')

  cd py-amqp
  python setup.py install --root="$pkgdir/" --optimize=1
}

package_python2-amqp() {
  depends=('python2-vine')

  cd py-amqp-py2
  python2 setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
