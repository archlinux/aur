# Maintainer: Michal Wojdyla < micwoj9292 at gmail dot com >
# Contributor: Andy Weidenbaum <archbaum@gmail.com>

pkgname=python2-plyer
pkgver=1.4.3
pkgrel=1
pkgdesc="Platform-independent wrapper for platform-dependent APIs"
arch=('any')
depends=('python2')
makedepends=('python2-setuptools')
url="https://github.com/kivy/plyer"
license=('MIT')
options=(!emptydirs)
source=(https://pypi.python.org/packages/source/p/${pkgname#python2-}/${pkgname#python2-}-$pkgver.tar.gz)
sha256sums=('bf8de0cf76811201c475c1763703c1dbcc40c1a0a5520e9bfeee92271ba7e600')

prepare(){
  cd "$srcdir/${pkgname#python2-}-$pkgver"

  msg 'Fixing Python version...'
  find . -type f -print0 | xargs -0 sed -i 's#/usr/bin/python#/usr/bin/python2#g'
  find . -type f -print0 | xargs -0 sed -i 's#/usr/bin/env python#/usr/bin/env python2#g'
}

build() {
  cd "$srcdir/${pkgname#python2-}-$pkgver"

  msg 'Installing...'
  python2 setup.py build
}

package() {
  cd "$srcdir/${pkgname#python2-}-$pkgver"

  msg 'Installing...'
  python2 setup.py install --root="$pkgdir" --optimize=1
}
