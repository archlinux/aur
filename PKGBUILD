# Maintainer: Yen Chi Hsuan <yan12125 at gmail dot com>

_npmname=jpm
pkgname=nodejs-$_npmname # All lowercase
pkgver=1.0.6
pkgrel=1
pkgdesc='Jetpack Mechanic utilities for creating, testing, running and packaging Mozilla Jetpack Addons'
arch=(any)
url='https://developer.mozilla.org/en-US/Add-ons/SDK/Tools/jpm'
license=('custom:MPL2')
depends=('nodejs')
makedepends=('npm')
source=(http://registry.npmjs.org/$_npmname/-/$_npmname-$pkgver.tgz)
sha256sums=('d2e75a07ea37696fcb7446408e4d80d31082e5a66f6e3b8c115de06199021027')

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
