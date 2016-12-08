# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgbase=python-chameleon
pkgname=('python-chameleon' 'python2-chameleon')
pkgver=3.0
pkgrel=1
pkgdesc="Fast HTML/XML Template Compiler"
arch=('any')
license=('custom:BSD' 'ZPL')
url="http://www.pagetemplates.org/"
makedepends=('python-setuptools' 'python2-setuptools' 'git')
source=("git+https://github.com/malthe/chameleon.git#tag=$pkgver")
sha512sums=('SKIP')

prepare() {
  cp -a chameleon{,-py2}
}

build() {
  cd "$srcdir"/chameleon
  python setup.py build

  cd "$srcdir"/chameleon-py2
  python2 setup.py build
}

check() {
  cd "$srcdir"/chameleon
  python setup.py test

  cd "$srcdir"/chameleon-py2
  python2 setup.py test
}

package_python-chameleon() {
  depends=('python')

  cd chameleon
  python setup.py install --root="$pkgdir" --optimize=1
  install -D -m644 LICENSE.txt "$pkgdir"/usr/share/licenses/$pkgname/LICENSE.txt
}

package_python2-chameleon() {
  depends=('python2')

  cd chameleon-py2
  python2 setup.py install --root="$pkgdir" --optimize=1
  install -D -m644 LICENSE.txt "$pkgdir"/usr/share/licenses/$pkgname/LICENSE.txt
}
