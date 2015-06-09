# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=python2-versiontools
pkgver=1.9.1
pkgrel=1
pkgdesc="Smart replacement for plain tuple used in __version__"
arch=('any')
depends=('python2')
makedepends=('python2-setuptools')
url="https://launchpad.net/versiontools"
license=('LGPL3')
options=(!emptydirs)
source=(https://pypi.python.org/packages/source/v/${pkgname#python2-}/${pkgname#python2-}-$pkgver.tar.gz
        https://pypi.python.org/packages/source/v/${pkgname#python2-}/${pkgname#python2-}-$pkgver.tar.gz.asc)
md5sums=('602b7db8eea30dd29a1d451997adf251'
         '0af35b19da5b1218ebc0307338ee241c')
sha256sums=('a969332887a18a9c98b0df0ea4d4ca75972f24ca94f06fb87d591377e83414f6'
            '7a2b5ef5a84a8512313993d82a94c115183f58e6924f80a45e1fe067fb24b3f7')
validpgpkeys=('A2C9EB19E937897573BB3113A911E21401448FA5')

prepare() {
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
