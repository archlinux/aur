# Maintainer: Yen Chi Hsuan <yan12125 at gmail dot com>

_npmname=web-ext
pkgname=nodejs-$_npmname # All lowercase
pkgver=1.8.0
pkgrel=1
pkgdesc='A command line tool to help build, run, and test web extensions'
arch=(any)
url='https://developer.mozilla.org/en-US/Add-ons/WebExtensions'
license=('custom:MPL2')
depends=('nodejs')
makedepends=('npm')
source=(http://registry.npmjs.org/$_npmname/-/$_npmname-$pkgver.tgz)
sha256sums=('0727008792ff15d33fa996bd6950b562db72ef15c09af84adff96ab7d3ca4c94')

package() {
  local _npmdir="$pkgdir/usr/lib/node_modules/"

  cd "$srcdir"

  mkdir -p $_npmdir
  cp -r --no-preserve=ownership package "$_npmdir/$_npmname"

  cd "$_npmdir/$_npmname"
  npm install --production

  mkdir -p "$pkgdir/usr/bin"
  ln -s "/usr/lib/node_modules/$_npmname/bin/$_npmname" "$pkgdir/usr/bin/$_npmname"

  mkdir -p "$pkgdir/usr/share/licenses/$pkgname"
  ln -s "/usr/lib/node_modules/$_npmname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:
