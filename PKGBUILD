# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgbase=python-chameleon
pkgname=('python-chameleon' 'python2-chameleon')
pkgver=3.4
pkgrel=1
pkgdesc="Fast HTML/XML Template Compiler"
arch=('any')
license=('custom:BSD' 'ZPL')
url="http://www.pagetemplates.org/"
makedepends=('python-setuptools' 'python2-setuptools')
source=("$pkgbase-$pkgver.tar.gz::https://github.com/malthe/chameleon/archive/$pkgver.tar.gz")
sha512sums=('7a45298b5f72c7cd63df1a4d69156eb13d288304ff6d89babd3858eb56c605acedf955e787da23fa9580be0561ea7f6024b3619cc238eb10042ce36a436ba95b')

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
