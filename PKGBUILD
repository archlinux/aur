# Maintainer: Yen Chi Hsuan <yan12125 at gmail dot com>

_npmname=jpm
pkgname=nodejs-$_npmname # All lowercase
pkgver=1.0.0
pkgrel=2
pkgdesc='Jetpack Mechanic utilities for creating, testing, running and packaging Mozilla Jetpack Addons'
arch=(any)
url='https://developer.mozilla.org/en-US/Add-ons/SDK/Tools/jpm'
license=('custom:MPL2')
depends=('nodejs')
makedepends=('npm')
source=(http://registry.npmjs.org/$_npmname/-/$_npmname-$pkgver.tgz)
sha1sums=(42c10a9aaabba2b8fc06bfc3c54a8b7bb5eca3f5)

package() {
  local _npmdir="$pkgdir/usr/lib/node_modules/"

  cd "$srcdir"

  mkdir -p $_npmdir
  cp -r --no-preserve=ownership package "$_npmdir/$_npmname"

  cd "$_npmdir/$_npmname"
  npm install

  mkdir -p "$pkgdir/usr/bin"
  ln -s "/usr/lib/node_modules/jpm/bin/jpm" "$pkgdir/usr/bin/jpm"

  mkdir -p "$pkgdir/usr/share/licenses/$pkgname"
  ln -s "/usr/lib/node_modules/jpm/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:
