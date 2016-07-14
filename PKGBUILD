# Maintainer: Patrik Plihal <patrik.plihal at gmail dot com>

pkgname=nunit3

pkgver_link=3.4.1
pkgver_linkname=3.4.1
pkgver=`echo $pkgver_linkname | sed 's/-/./; s/-//'`

pkgrel=1
pkgdesc="Unit-testing framework for all .NET languages."
arch=('any')
license=('custom')
url="http://www.nunit.com"
depends=('mono')
makedepends=('sed')
source=("https://github.com/nunit/nunit/releases/download/${pkgver_link}/NUnit-${pkgver_linkname}.zip")
sha256sums=('a97cac037ac6c54b46eae5c688b3f9d82f299831fd133b7db428a2eea1518989')

package() {  
  mkdir -p $pkgdir/usr/{share/licenses,share/icons,lib}/$pkgname
  
  #bins
  cp -r $srcdir/bin/* $pkgdir/usr/lib/$pkgname
  
  #license
  cp $srcdir/LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/"
  
  #icon
  cp $srcdir/nunit.ico "$pkgdir/usr/share/icons/$pkgname/"

  #launchers
  mkdir -p "$pkgdir/usr/bin/"
  
#   echo '#!/bin/sh' > "$pkgdir/usr/bin/nunit3"
#   echo 'exec /usr/bin/mono --debug /usr/lib/nunit3/nunit.exe "$@"' >> "$pkgdir/usr/bin/nunit3"
#   chmod +x "$pkgdir/usr/bin/nunit3"
  
  echo '#!/bin/sh' > "$pkgdir/usr/bin/nunit3-console"
  echo 'exec /usr/bin/mono --debug /usr/lib/nunit3/nunit3-console.exe "$@"' >> "$pkgdir/usr/bin/nunit3-console"
  chmod +x "$pkgdir/usr/bin/nunit3-console"
}
