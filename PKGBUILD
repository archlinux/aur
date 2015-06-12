# Maintainer: Michael Schubert <mschu.dev at gmaiL>

pkgname=python2-rpy2-hg
pkgver=2.3.8
pkgrel=1
pkgdesc="A simple, robust Python interface to the R Programming Language."
arch=('i686' 'x86_64')
url="http://rpy.sourceforge.net/"
license=('MPL' 'GPL' 'LGPL')
makedepends=('mercurial')
depends=('python2-numpy' 'r')
provides=('python2-rpy2')
conflicts=('python2-rpy2')
replaces=('python2-rpy2-svn')
source=($pkgname::hg+https://bitbucket.org/lgautier/rpy2)
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  hg checkout tip
  echo $(hg identify -n).$(hg identify -i)
}

build() {
  cd "$srcdir/$pkgname"
  python2 setup.py build
}

package() {
  cd "$srcdir/$pkgname"
  python2 setup.py install --skip-build --prefix=/usr --root="$pkgdir" --optimize=1

  mkdir -p "$pkgdir/etc/ld.so.conf.d"
  echo /usr/lib/R/lib > "$pkgdir/etc/ld.so.conf.d/rpy2-py2.7.conf"
}

