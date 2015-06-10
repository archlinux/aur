# Contributor: Alexander Rødseth <rodseth@gmail.com>
pkgname=icompile
pkgver=0.5.16
pkgrel=1
pkgdesc="Zero-configuration build system"
arch=('any')
url="http://ice.sourceforge.net"
license=('BSD')
depends=('python2')
source=("http://kent.dl.sourceforge.net/sourceforge/ice/$pkgname-$pkgver.tar.gz")
md5sums=('34aee2f877f45b85c934cf11a340503e')

build() {
  cd "$srcdir"

  # Fix to use python 2 instead of python 3
  sed -i 's:bin/env python:bin/env python2:' "$pkgname"
  # Fix flag that does not work on the latest version of gcc that comes with Arch
  sed -i "s:state.compilerOptions.append('-fpmath=sse'):pass:" "$pkgname"
  mkdir -p "$pkgdir/usr/lib/python2.7/site-packages"
}

package() {
  cd "$srcdir"

  cp -r ice "$pkgdir/usr/lib/python2.7/site-packages/"
  install -Dm644 $pkgname.html "$pkgdir/usr/share/doc/$pkgname/$pkgname.html"
  install -Dm755 $pkgname "$pkgdir/usr/bin/$pkgname"
  mkdir -p "$pkgdir/usr/share/licenses/$pkgname"
  touch "$pkgdir/usr/share/licenses/$pkgname/BSD"
}

# vim:set ts=2 sw=2 et:
