# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=python2-pysha3
pkgver=0.3
pkgrel=1
pkgdesc="SHA-3 wrapper (keccak) for Python"
arch=('i686' 'x86_64')
depends=('python2')
makedepends=('python2-setuptools')
url="https://bitbucket.org/tiran/pykeccak"
license=('PSFL')
options=(!emptydirs)
source=(https://pypi.python.org/packages/source/p/${pkgname#python2-}/${pkgname#python2-}-$pkgver.tar.gz)
md5sums=('150ef07e47b6ef79bdf7717036ceccc7')
sha256sums=('191c5f1f77de11fb847c6c825b72f33c81ce67f72055038175fccbbeb891f04d')

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
