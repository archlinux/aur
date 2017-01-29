# Maintainer: Patrice Peterson <runiq at archlinux dot us>
# Contributor: Francois Boulogne <fboulogne at april dot org>

pkgname="python2-latexcodec"
_pkgname="latexcodec"
pkgver="1.0.4"
pkgrel=1
pkgdesc="Pybtex reads citation information from a file and produces a formatted bibliography."
arch=("any")
url="http://pybtex.sourceforge.net"
license=("GPL")
depends=("python2" "python2-six")
makedepends=("python2-distribute")
source=("https://pypi.io/packages/source/l/$_pkgname/$_pkgname-$pkgver.tar.gz")
sha256sums=('62bf8a3ee298f169a4d014dad5522bc1325b54dc98789a453fd338620387cb6c')

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
