# Maintainer: Michael Schubert <mschu.dev at gmail>

pkgname=python-rpy2-hg
pkgver=2542.d0b42a0bee6c
pkgrel=1
pkgdesc="A simple, robust Python interface to the R Programming Language."
arch=('i686' 'x86_64')
url="http://rpy.sourceforge.net/"
license=('MPL' 'GPL' 'LGPL')
makedepends=('mercurial')
depends=('python-numpy' 'r')
provides=('python-rpy2')
conflicts=('python-rpy2')
source=($pkgname::hg+https://bitbucket.org/rpy2/rpy2)
md5sums=('SKIP')
  
pkgver() {
  cd "$srcdir/$pkgname"
  echo $(hg identify -n).$(hg identify -i)
} 

build() {
  cd "$srcdir/$pkgname"
  python setup.py build
} 

package() {
  cd "$srcdir/$pkgname"
  python setup.py install --skip-build --prefix=/usr --root="$pkgdir" --optimize=1

  mkdir -p "$pkgdir/etc/ld.so.conf.d"
  echo /usr/lib/R/lib > "$pkgdir/etc/ld.so.conf.d/rpy2.conf"
}

