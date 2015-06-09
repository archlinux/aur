# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=python2-chaussette
pkgver=1.3.0
pkgrel=1
pkgdesc="WSGI Server for Circus"
arch=('any')
depends=('python2' 'python2-six')
makedepends=('python2-setuptools')
url="https://github.com/mozilla-services/chaussette"
license=('Apache')
options=(!emptydirs)
source=(https://pypi.python.org/packages/source/c/${pkgname#python2-}/${pkgname#python2-}-$pkgver.tar.gz)
md5sums=('b25521e7a58853718d239976ec1c8433')
sha256sums=('6777f2460e4efcd26551c6f265d9e612ba95c2a0b2e53104c7d4d20e7f3d5a1b')
provides=('chaussette' 'python2-chaussette')
conflicts=('chaussette')

prepare(){
  cd "$srcdir/${pkgname#python2-}-$pkgver"

  msg 'Fixing Python version...'
  find . -type f -print0 | xargs -0 sed -i 's#/usr/bin/python#/usr/bin/python2#g'
  find . -type f -print0 | xargs -0 sed -i 's#/usr/bin/env python#/usr/bin/env python2#g'
}

package() {
  cd "$srcdir/${pkgname#python2-}-$pkgver"

  msg 'Installing...'
  python2 setup.py install --root="$pkgdir" --optimize=1
}
