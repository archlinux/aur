# $Id$
# Maintainer: Sid Karunaratne <sid@karunaratne.net>

pkgbase=python2-utils
_pkgname=utils
pkgname=(python2-utils)
pkgver=0.8.0
pkgrel=1
pkgdesc="Collected functions which should be in the standard library"
url="http://pypi.python.org/pypi/utils"
arch=('any')
license=('BSD')
makedepends=('python2-setuptools' python-setuptools)
source=("https://pypi.python.org/packages/source/u/utils/utils-${pkgver}.tar.gz")
sha256sums=('272ebb342ff792ea61daf352ce7bef14e9402bf5d2f1766c47f99b2a4c779cca')

prepare() {
    cp -a $srcdir/$_pkgname-$pkgver $srcdir/$_pkgname-$pkgver-2
    find $_pkgname-$pkgver-2 -name \*.py -exec sed -i '1s/python$/&2/' {} +
}

build() {
  cd "$srcdir/$_pkgname-$pkgver-2"
  python2 setup.py build
}

package_python2-utils() {
  cd "$srcdir/$_pkgname-$pkgver-2"
  chmod 644 -R utils.egg-info
  depends=(python2)
  python2 setup.py install --root="$pkgdir/"
}
