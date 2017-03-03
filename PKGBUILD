# Maintainer: Achilleas Pipinellis <axilleas archlinux info>
# Cotributor: Andy Weidenbaum <archbaum@gmail.com>

pkgname=python2-dopy
pkgver=0.3.7a
pkgrel=1
pkgdesc="Digital Ocean API Python wrapper"
arch=('any')
depends=('python2' 'python2-requests')
makedepends=('python2-distribute')
url="https://pypi.python.org/pypi/dopy"
license=('MIT')
source=(https://pypi.python.org/packages/source/d/${pkgname#python2-}/${pkgname#python2-}-$pkgver.tar.gz)

prepare() {
  cd $srcdir/${pkgname#python2-}-$pkgver

  msg 'Fixing Python version...'
  find . -type f -print0 | xargs -0 sed -i 's#/usr/bin/python#/usr/bin/python2#g'
  find . -type f -print0 | xargs -0 sed -i 's#/usr/bin/env python#/usr/bin/env python2#g'
}

build() {
  cd $srcdir/${pkgname#python2-}-$pkgver

  msg 'Building...'
  python2 setup.py build
}

package() {
  cd $srcdir/${pkgname#python2-}-$pkgver

  msg 'Installing...'
  python2 setup.py install --root="$pkgdir" --optimize=1
}
md5sums=('cf5c95287af0aca2e320be1569e197bd')
