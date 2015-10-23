# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=python2-luigi
pkgver=2.0.0
pkgrel=1
pkgdesc="Workflow mgmgt + task scheduling + dependency resolution"
arch=('any')
depends=('python2'
         'python2-python-daemon'
         'python2-tornado')
makedepends=('python2-setuptools')
optdepends=('python2-mechanize: for debugging Hadoop jobs more easily')
url="https://github.com/spotify/luigi"
license=('Apache')
options=(!emptydirs)
source=(https://pypi.python.org/packages/source/l/${pkgname#python2-}/${pkgname#python2-}-$pkgver.tar.gz)
md5sums=('06258afcfcdd2f829167450fd5fed604')
sha256sums=('0ec3d719f0287290af8d90a9de0d7772c54732d8e917dabcaacb44ac6c141866')
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
