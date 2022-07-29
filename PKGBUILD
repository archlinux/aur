# Maintainer: Matthias Mailänder <matthias@mailaender.name>
# Contributor: Patrik Plihal <patrik.plihal at gmail dot com>
# Contributor: Jan Stępień <jstepien@users.sourceforge.net>

pkgname=nunit2
pkgver=2.7.1
pkgrel=1
pkgdesc="Unit-testing framework for all .NET languages."
arch=('any')
license=('custom')
url="https://nunit.org/"
depends=('mono')
source=("https://github.com/nunit-legacy/nunitv2/releases/download/${pkgver}/NUnit-${pkgver}.zip")
sha256sums=('2353b5bf95b1ce8d58744bea76e37e4455a0683a4332d0b9a931afe4c077b253')

package() {
  mkdir -p $pkgdir/usr/{share/licenses,lib}/$pkgname

  cp -r $srcdir/bin/* $pkgdir/usr/lib/$pkgname
  cp $srcdir/license.txt "$pkgdir/usr/share/licenses/$pkgname/"

  mkdir -p "$pkgdir/usr/bin/"

  echo '#!/bin/sh' > "$pkgdir/usr/bin/nunit2"
  echo 'exec /usr/bin/mono --debug /usr/lib/nunit2/nunit.exe "$@"' >> "$pkgdir/usr/bin/nunit2"
  chmod +x "$pkgdir/usr/bin/nunit2"
  
  echo '#!/bin/sh' > "$pkgdir/usr/bin/nunit2-console"
  echo 'exec /usr/bin/mono --debug /usr/lib/nunit2/nunit-console.exe "$@"' >> "$pkgdir/usr/bin/nunit2-console"
  chmod +x "$pkgdir/usr/bin/nunit2-console"
}
