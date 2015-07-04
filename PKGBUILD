# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=python2-luigi
pkgver=1.3.0
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
md5sums=('948a6574e4d4e1d1d8b8a355ca0cdaf7')
sha256sums=('69f0e75c305da8c8de4a538011b80136ee4f5e3d449f4de9b17d94b3cc9b7f7e')
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
