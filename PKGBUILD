# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: mutantmonkey <aur@mutantmonkey.in>

pkgbase=python-amqp
pkgname=('python-amqp' 'python2-amqp')
pkgver=2.4.2
_commit=dfc336d2db69f0e4e8aeda00650c1c5e23b9f93c
pkgrel=1
pkgdesc="Low-level AMQP client for Python (fork of amqplib)"
arch=('any')
url="https://github.com/celery/py-amqp"
license=('LGPL')
makedepends=('python-vine' 'python2-vine')
checkdepends=('python-case' 'python2-case' 'python-pytest-sugar' 'python2-pytest-sugar')
source=("$pkgbase-$_commit.tar.gz::https://github.com/celery/py-amqp/archive/$_commit.tar.gz")
sha512sums=('e820e733293428bfe86f185136060847d99251baa571ec6f106a9d6db01251b8950db4ead815b3df662c72166ffd575afb45389e2c2c19026e43a21e738a15a6')

prepare() {
  mv py-amqp-{$_commit,$pkgver}
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
