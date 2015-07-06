# Maintainer: Kevin MacMartin <prurigro@gmail.com>
# Adapted from the wizorb package contributed by TastyPi

_pkgname=wizorb
pkgname=$_pkgname-hib
pkgver=06232015
pkgrel=1
pkgdesc='A retro-RPG themed breakout style game (Humble Bundle version)'
url='http://www.wizorb.com'
license=('custom:commercial')
depends=('glibc')
arch=('i686' 'x86_64')
options=('!strip' '!upx')
source=(
  "hib://$_pkgname-06232015-bin"
  "$_pkgname.desktop"
)
sha512sums=(
  '556ec725522545ab5b99ef2f21a4e4572b50537ddf551e340801874db3fff8fc042362b511de779c8e6425a6c079de31788e03b01766aba5485b900cc34086ea'
  'd5d30b3c9e39de446a4d5be9781c4001557b1b66e96fa85331fbc8cc5b58ecea82c18c734b6fed97d2fdd78798d473c759a05d1f986c2b81deb49b5cec2e4ffb'
)

package() {
  install -d "$pkgdir/opt/$_pkgname"
  for dir in ./*; do
    [[ -d "$dir" ]] \
      && cp -r --no-preserve=ownership "$dir" "$pkgdir/opt/$_pkgname/"
  done
  install -Dm644 $_pkgname.desktop "$pkgdir/usr/share/applications/$_pkgname.desktop"
  install -dm755 "$pkgdir/usr/bin"
  printf '%s\n\n%s\n%s\n' \
    '#!/usr/bin/env bash' \
    'cd /opt/wizorb/data' \
    './Wizorb' > "$pkgdir/usr/bin/$_pkgname"
  chmod 755 "$pkgdir/usr/bin/$_pkgname"
}

