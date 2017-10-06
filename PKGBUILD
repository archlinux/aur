# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgbase=python-chameleon
pkgname=('python-chameleon' 'python2-chameleon')
pkgver=3.2
pkgrel=1
pkgdesc="Fast HTML/XML Template Compiler"
arch=('any')
license=('custom:BSD' 'ZPL')
url="http://www.pagetemplates.org/"
makedepends=('python-setuptools' 'python2-setuptools')
source=("$pkgbase-$pkgver.tar.gz::https://github.com/malthe/chameleon/archive/$pkgver.tar.gz")
sha512sums=('f27d235f1496078fccd2d1f97c2b01efa56443c0130ff103cc4f66b06a49d3eca2e2758a877bf21132cd87d20687b7a04275c7110527821e9ac4cc61c813f0b7')

prepare() {
  cp -a chameleon-$pkgver{,-py2}
}

build() {
  cd "$srcdir"/chameleon-$pkgver
  python setup.py build

  cd "$srcdir"/chameleon-$pkgver-py2
  python2 setup.py build
}

check() {
  cd "$srcdir"/chameleon-$pkgver
  python setup.py test

  cd "$srcdir"/chameleon-$pkgver-py2
  python2 setup.py test
}

package_python-chameleon() {
  depends=('python')

  cd chameleon-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1
  install -D -m644 LICENSE.txt "$pkgdir"/usr/share/licenses/$pkgname/LICENSE.txt
}

package_python2-chameleon() {
  depends=('python2')

  cd chameleon-$pkgver-py2
  python2 setup.py install --root="$pkgdir" --optimize=1
  install -D -m644 LICENSE.txt "$pkgdir"/usr/share/licenses/$pkgname/LICENSE.txt
}
