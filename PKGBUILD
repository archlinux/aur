# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=python2-luigi
pkgver=1.2.1
pkgrel=1
pkgdesc="Workflow mgmgt + task scheduling + dependency resolution"
arch=('any')
depends=('python2'
         'python2-cached-property'
         'python2-pyparsing'
         'python2-python-daemon'
         'python2-tornado')
makedepends=('python2-setuptools')
optdepends=('python2-mechanize: for debugging Hadoop jobs more easily')
url="https://github.com/spotify/luigi"
license=('Apache')
options=(!emptydirs)
source=(https://pypi.python.org/packages/source/l/${pkgname#python2-}/${pkgname#python2-}-$pkgver.tar.gz)
md5sums=('a147bba0bb1999b5856f4910bf15a9c0')
sha256sums=('a43d81514a0fcaa057f23c223066f2e2256cc361d6d0cc56c86f02aac84692c9')
provides=('luigi' 'python2-luigi')
conflicts=('luigi')

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
