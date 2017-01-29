# Maintainer: Patrice Peterson <runiq at archlinux dot us>
# Contributor: Francois Boulogne <fboulogne at april dot org>

pkgname="python2-pybtex"
_pkgname="pybtex"
pkgver="0.21"
pkgrel=1
pkgdesc="Pybtex reads citation information from a file and produces a formatted bibliography."
arch=("any")
url="http://pybtex.sourceforge.net"
license=("GPL")
depends=("python2")
makedepends=("python2-distribute")
source=("https://pypi.io/packages/source/p/$_pkgname/$_pkgname-$pkgver.tar.gz")
sha256sums=('af8a6c7c74954ad305553b118d2757f68bc77c5dd5d5de2cc1fd16db90046000')

build() {
  cd "$srcdir/$_pkgname-$pkgver"
  # Replace python with python2
  for file in $(find $srcdir/$_pkgname-$pkgver -name "*.py" -print); do
      sed -i 's_^#!.*/usr/bin/python_#!/usr/bin/python2_' "$file"
      sed -i 's_^#!.*/usr/bin/env.*python_#!/usr/bin/env python2_' "$file"
  done
}

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  python2 setup.py install --prefix="/usr" --root="${pkgdir}" 
}

# vim:ts=2:sw=2:et:
