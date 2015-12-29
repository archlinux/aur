# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=python2-luigi
pkgver=2.0.1
pkgrel=2
pkgdesc="Workflow mgmgt + task scheduling + dependency resolution"
arch=('any')
depends=('python2' 'python2-daemon' 'python2-tornado')
makedepends=('python2-setuptools')
optdepends=('python2-mechanize: for debugging Hadoop jobs more easily')
url="https://github.com/spotify/luigi"
license=('Apache')
options=(!emptydirs)
source=(https://pypi.python.org/packages/source/l/${pkgname#python2-}/${pkgname#python2-}-$pkgver.tar.gz)
md5sums=('625b7609fd6566fb14c25c8f2592d95f')
sha256sums=('678eb30789f43e32e4f001592fd0f607c6e012d56a00fd7e82f6c9e500db4b4c')
provides=('luigi' 'python2-luigi')
conflicts=('luigi')

prepare() {
  cd "$srcdir/${pkgname#python2-}-$pkgver"

  msg2 'Fixing Python version...'
  find . -type f -print0 | xargs -0 sed -i 's#/usr/bin/python#/usr/bin/python2#g'
  find . -type f -print0 | xargs -0 sed -i 's#/usr/bin/env python#/usr/bin/env python2#g'
}

package() {
  cd "$srcdir/${pkgname#python2-}-$pkgver"

  msg2 'Installing...'
  python2 setup.py install --root="$pkgdir" --optimize=1
}
