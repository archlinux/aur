# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgbase=python-translationstring
pkgname=('python-translationstring' 'python2-translationstring')
pkgver=1.3
pkgrel=3
pkgdesc="Utility library for i18n relied on by various Repoze and Pyramid packages"
arch=('any')
license=('custom:BSD')
url="https://github.com/Pylons/translationstring"
makedepends=('python-setuptools' 'python2-setuptools' 'git')
checkdepends=('python-nose' 'python2-nose')
source=("git+https://github.com/Pylons/translationstring.git#tag=$pkgver")
sha512sums=('SKIP')

prepare() {
  cp -a translationstring{,-py2}
}

build() {
  cd "$srcdir/translationstring"
  python setup.py build

  cd "$srcdir/translationstring-py2"
  python2 setup.py build
}

check() {
  cd "$srcdir/translationstring"
  nosetests3

  cd "$srcdir/translationstring-py2"
  nosetests2
}

package_python-translationstring() {
  depends=('python')

  cd translationstring
  python setup.py install --root="${pkgdir}" --optimize=1
  install -D -m644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt"
}

package_python2-translationstring() {
  depends=('python2')

  cd translationstring-py2
  python2 setup.py install --root="${pkgdir}" --optimize=1
  install -D -m644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt"
}
