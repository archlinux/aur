# Maintainer: Patrik Plihal <patrik.plihal at gmail dot com>

pkgname=nunit3

pkgver_link=3.0.0-beta-2
pkgver_linkname=3.0.0-beta-2
pkgver=`echo $pkgver_linkname | sed 's/-/./; s/-//'`

pkgrel=1
pkgdesc="Unit-testing framework for all .NET languages."
arch=('any')
license=('custom')
url="http://www.nunit.com"
depends=('mono' 'sed')
source=("https://github.com/nunit/nunit/releases/download/${pkgver_link}/NUnit-${pkgver_linkname}.zip")
sha256sums=('aa9ed227cd420e98c196c2e42f1109219ae5b504b95077a55ff223fdf1dc6dba')

package() {  
  mkdir -p $pkgdir/usr/{share/doc,share/licenses,lib}/$pkgname
  
  #bins
  cp -r $srcdir/bin/* $pkgdir/usr/lib/$pkgname
  
  #license
  mkdir -p "$pkgdir/usr/share/licenses/$pkgname/"
  cp $srcdir/LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/"
  
  #launchers
  mkdir -p "$pkgdir/usr/bin/"
  
#   echo '#!/bin/sh' > "$pkgdir/usr/bin/nunit3"
#   echo 'exec /usr/bin/mono --debug /usr/lib/nunit3/nunit.exe "$@"' >> "$pkgdir/usr/bin/nunit3"
#   chmod +x "$pkgdir/usr/bin/nunit3"
  
  echo '#!/bin/sh' > "$pkgdir/usr/bin/nunit3-console"
  echo 'exec /usr/bin/mono --debug /usr/lib/nunit3/nunit-console.exe "$@"' >> "$pkgdir/usr/bin/nunit3-console"
  chmod +x "$pkgdir/usr/bin/nunit3-console"
}
