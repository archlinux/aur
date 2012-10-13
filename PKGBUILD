#$Id$
# Maintainer: Chris Brannon <cmbrannon79@gmail.com>
# Contributor: Jeff Mickey <j@codemac.net>
# Contributor: tardo <tardo@nagi-fanboi.net>

pkgname=cxxtest
pkgver=4.0.3
pkgrel=2
pkgdesc="A JUnit/CppUnit/xUnit-like framework for C++."
arch=('any')
url="http://cxxtest.com"
license=("LGPL")
depends=('python')
source=(http://downloads.sourceforge.net/$pkgname/$pkgname-$pkgver.tar.gz)
md5sums=('d65068ba20ce42176c9fb33dde16b727')

package() {
  cd "$srcdir/$pkgname"

  install -m 755 -d "$pkgdir/usr/bin" "$pkgdir/usr/include/cxxtest"
  install -m 755 bin/cxxtestgen "$pkgdir/usr/bin/"
  install -m 644 cxxtest/* "$pkgdir/usr/include/cxxtest/"
  install -dm755 "$pkgdir"/usr/share/doc/$pkgname/sample
  install -m644 README "$pkgdir/usr/share/doc/$pkgname"
  install -m644 doc/guide.{html,txt} "$pkgdir/usr/share/doc/$pkgname"

  cp -Rf sample/* "$pkgdir/usr/share/doc/$pkgname/sample"

  cd python
  python setup.py install --root="$pkgdir/" --optimize=1

  sed -i "s:/env python:/python3:g" "$pkgdir/usr/bin/cxxtestgen"
}

