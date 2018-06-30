# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgbase=python-chameleon
pkgname=('python-chameleon' 'python2-chameleon')
pkgver=3.3
pkgrel=2
pkgdesc="Fast HTML/XML Template Compiler"
arch=('any')
license=('custom:BSD' 'ZPL')
url="http://www.pagetemplates.org/"
makedepends=('python-setuptools' 'python2-setuptools')
source=("$pkgbase-$pkgver.tar.gz::https://github.com/malthe/chameleon/archive/$pkgver.tar.gz")
sha512sums=('72ea9138bb8118451102a4a7a23851bc4b389842e30b63d53e187a9f768f7e16782ee3fcf5ba86c3c166b90936c7c91d7c5b7b10c24a3383e10a2d70f656351f')

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
