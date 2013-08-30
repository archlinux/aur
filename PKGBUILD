# Maintainer: Alexander Rødseth <rodseth@gmail.com>
# Contributor: Chris Brannon <cmbrannon79@gmail.com>
# Contributor: Jeff Mickey <j@codemac.net>
# Contributor: tardo <tardo@nagi-fanboi.net>

pkgname=cxxtest
pkgver=4.3
pkgrel=1
pkgdesc='Unit testing framework for C++'
arch=('any')
url='http://cxxtest.com/'
license=('LGPL')
depends=('python')
source=("http://downloads.sourceforge.net/$pkgname/$pkgname-$pkgver.tar.gz")
sha256sums=('356d0f4810e8eb5c344147a0cca50fc0d84122c286e7644b61cb365c2ee22083')

prepare() {
  cd "$srcdir/$pkgname-$pkgver"

  sed -i 's:env python:python3:g' bin/cxxtestgen
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  install -m 755 -d "$pkgdir/usr/"{bin,include/cxxtest}
  install -m 755 bin/cxxtestgen "$pkgdir/usr/bin/"
  install -m 644 cxxtest/* "$pkgdir/usr/include/cxxtest/"
  install -dm755 "$pkgdir"/usr/share/doc/$pkgname/sample
  install -m644 README "$pkgdir/usr/share/doc/$pkgname"
  install -m644 doc/guide.txt "$pkgdir/usr/share/doc/$pkgname"

  cp -Rf sample/* "$pkgdir/usr/share/doc/$pkgname/sample"

  cd python
  python setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
