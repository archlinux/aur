# Maintainer: Yen Chi Hsuan <yan12125 at gmail dot com>

_npmname=jpm
pkgname=nodejs-$_npmname # All lowercase
pkgver=1.3.1
pkgrel=2
pkgdesc='Jetpack Mechanic utilities for creating, testing, running and packaging Mozilla Jetpack Addons'
arch=(any)
url='https://developer.mozilla.org/en-US/Add-ons/SDK/Tools/jpm'
license=('custom:MPL2')
depends=('nodejs')
makedepends=('npm')
source=(https://registry.npmjs.org/$_npmname/-/$_npmname-$pkgver.tgz)
sha256sums=('8e575106504014341eaa141cc87340b4232e49d1ed73d3297029994d7a7413d4')

package() {
  local _npmdir="$pkgdir/usr/lib/node_modules/"

  cd "$srcdir"

  mkdir -p $_npmdir
  cp -r --no-preserve=ownership package "$_npmdir/$_npmname"

  cd "$_npmdir/$_npmname"
  npm install --production

  mkdir -p "$pkgdir/usr/bin"
  ln -s "/usr/lib/node_modules/jpm/bin/jpm" "$pkgdir/usr/bin/jpm"

  mkdir -p "$pkgdir/usr/share/licenses/$pkgname"
  ln -s "/usr/lib/node_modules/jpm/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:
