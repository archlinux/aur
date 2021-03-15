# Contributor: Andy Weidenbaum <archbaum@gmail.com>

pkgname=python2-python-tdbus
pkgver=0.11
pkgrel=1
pkgdesc="Simple Python bindings for D-BUS"
arch=('i686' 'x86_64')
depends=('python2')
makedepends=('python2-setuptools')
url="https://github.com/hmvp/python-tdbus"
license=('MIT')
options=(!emptydirs)
source=(https://pypi.python.org/packages/source/p/${pkgname#python2-}/${pkgname#python2-}-$pkgver.tar.gz)
sha256sums=('c26b906f0128550ca5f1bf66226fc7e23a747e30b1fd4f9607b8148164e95b4e')

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
