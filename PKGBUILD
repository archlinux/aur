# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-translationstring
pkgver=1.3
pkgrel=6
pkgdesc="Utility library for i18n relied on by various Repoze and Pyramid packages"
arch=('any')
license=('custom:BSD')
url="https://github.com/Pylons/translationstring"
depends=('python')
makedepends=('python-setuptools' 'git')
checkdepends=('python-nose')
source=("git+https://github.com/Pylons/translationstring.git#tag=$pkgver")
sha512sums=('SKIP')

prepare() {
  cp -a translationstring{,-py2}
}

build() {
  cd "$srcdir/translationstring"
  python setup.py build
}

check() {
  cd "$srcdir/translationstring"
  nosetests3
}

package() {
  cd translationstring
  python setup.py install --root="${pkgdir}" --optimize=1
  install -D -m644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt"
}
