# Maintainer: Sebastien Duthil <duthils@free.fr>

pkgname=thrive
pkgver=0.3.4
pkgrel=1
pkgdesc="Game about evolution, in which the player guides a species from their origin as a microbe to the space age and beyond. "
arch=('i686' 'x86_64')
url="http://revolutionarygamesstudio.com"
license=('GPL')
depends=('jasper' 'ilbc' 'libidn2')
makedepends=('p7zip')
source=(https://github.com/Revolutionary-Games/Thrive/releases/download/v${pkgver}/LINUX_Thrive.${pkgver}.7z
        thrive.sh)
sha256sums=('2d1cb3bc0c808aa6ca32f8c0d8979c2a79e81879a70e5d227723d7a782017502'
            'd4ffae8d96c0a2e2f23a281053a6d5817f964668556e770c2b62574d86c74ce7')
_Pkgname=Thrive

package() {
  cd "$srcdir/$_Pkgname-$pkgver"

  mkdir -p "$pkgdir/opt/thrive"
  cp -r * "$pkgdir/opt/thrive"
  chgrp -R games "$pkgdir/opt/thrive"
  chmod -R g+w "$pkgdir/opt/thrive"
  install -Dm755 "$srcdir/thrive.sh" "$pkgdir/usr/bin/thrive"

  # workaround hard dependency to libilbc.so.0, when ilbc only provides libilbc.so
  mkdir -p "$pkgdir/usr/lib"
  ln -s libilbc.so "$pkgdir/usr/lib/libilbc.so.0"
}
