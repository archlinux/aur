# Contributor: Jan Stępień <jstepien@users.sourceforge.net>
# Contributor: Patrik Plihal <patrik.plihal@gmail.com>

pkgname=nunit2
pkgver=2.6.4
pkgrel=2
pkgdesc="Unit-testing framework for all .NET languages. (This seems to be the last 2.X release)"
arch=('any')
license=('custom')
url="http://www.nunit.com"
depends=('mono')
source=("http://github.com/nunit/nunitv2/releases/download/$pkgver/NUnit-$pkgver.zip")
md5sums=('57b094983ee6c84f0d2e3d7dc0678dca')

package() {
  srcdir=$srcdir"/NUnit-$pkgver"
  
  mkdir -p $pkgdir/usr/{share/doc,share/licenses,lib}/$pkgname
  
  #bins
  cp -r $srcdir/bin/* $pkgdir/usr/lib/$pkgname
  
  #license
  mkdir -p "$pkgdir/usr/share/licenses/$pkgname/"
  cp $srcdir/license.txt "$pkgdir/usr/share/licenses/$pkgname/"
  
  #docs
  cp -r $srcdir/doc/* $pkgdir/usr/share/doc/$pkgname/
  
  #launchers
  mkdir -p "$pkgdir/usr/bin/"
  
  echo '#!/bin/sh' > "$pkgdir/usr/bin/nunit2"
  echo 'exec /usr/bin/mono --debug /usr/lib/nunit2/nunit.exe "$@"' >> "$pkgdir/usr/bin/nunit2"
  chmod +x "$pkgdir/usr/bin/nunit2"
  
  echo '#!/bin/sh' > "$pkgdir/usr/bin/nunit2-console"
  echo 'exec /usr/bin/mono --debug /usr/lib/nunit2/nunit-console.exe "$@"' >> "$pkgdir/usr/bin/nunit2-console"
  chmod +x "$pkgdir/usr/bin/nunit2-console"
}