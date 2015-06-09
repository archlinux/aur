# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=python2-plyer
pkgver=1.2.4
pkgrel=1
pkgdesc="Platform-independent wrapper for platform-dependent APIs"
arch=('any')
depends=('python2')
makedepends=('python2-setuptools')
url="https://github.com/kivy/plyer"
license=('MIT')
options=(!emptydirs)
source=(https://pypi.python.org/packages/source/p/${pkgname#python2-}/${pkgname#python2-}-$pkgver.tar.gz)
md5sums=('30ed5b5efe8ecac3395944e938f89cab')
sha256sums=('3e3267d1414242c35e5d381d5bfc4f2651e181d11bc374ecc90d00658d05aaaf')

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
