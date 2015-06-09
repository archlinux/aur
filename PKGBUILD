# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=python2-python-tdbus
pkgver=0.9
pkgrel=1
pkgdesc="Simple Python bindings for D-BUS"
arch=('i686' 'x86_64')
depends=('python2')
makedepends=('python2-setuptools')
url="https://github.com/geertj/python-tdbus"
license=('MIT')
options=(!emptydirs)
source=(https://pypi.python.org/packages/source/p/${pkgname#python2-}/${pkgname#python2-}-$pkgver.tar.gz)
md5sums=('5452a6afe95f9a4fc62d94130abd553f')
sha256sums=('5bd23e7c67de5a410a3668076f0bdd3460d10e7d7253e496febb2345325fbf22')

prepare(){
  cd "$srcdir/${pkgname#python2-}-$pkgver"

  msg 'Fixing Python version...'
  find . -type f -print0 | xargs -0 sed -i 's#/usr/bin/python#/usr/bin/python2#g'
  find . -type f -print0 | xargs -0 sed -i 's#/usr/bin/env python#/usr/bin/env python2#g'
}

build() {
  cd "$srcdir/${pkgname#python2-}-$pkgver"

  msg 'Building...'
  python2 setup.py build
}

package() {
  cd "$srcdir/${pkgname#python2-}-$pkgver"

  msg 'Installing...'
  python2 setup.py install --root="$pkgdir" --optimize=1
}
