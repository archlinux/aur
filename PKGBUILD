# $Id$
# Maintainer: Fabien Devaux <fdev31 at gmail dot com>

pkgname=a8
provides=('a8')
pkgver=0.11
pkgrel=2
pkgdesc="The Abominade IDE"
arch=('any')
url="http://code.google.com/p/abominade/"
license=('GPL')
depends=('python2' 'pygtkhelpers-hg' 'python2-logbook' 'python2-psutil' 'python2-yaml' 'vte')
makedepends=('python2-distribute')
source=(http://pypi.python.org/packages/source/a/${pkgname}/${pkgname}-${pkgver}.tar.gz)
md5sums=('13e135f42427cd7bd4736c6a42e3ff10')

build() {
   cd "${srcdir}/${pkgname}-${pkgver}"
   echo 'import os' >> $pkgname/__init__.py
   echo 'os.environ["LD_PRELOAD"] = "/usr/lib/libpython2.7.so"' >> $pkgname/__init__.py
   python2 setup.py build || exit 1
   chmod -R a+rX .
   python2 setup.py install --root="${pkgdir}" --optimize=1 || exit 1
}

