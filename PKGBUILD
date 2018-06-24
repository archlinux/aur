
# Maintainer: Stijn Seghers <stijnseghers at gmail dot com>

pkgname=stylelint-config-standard
pkgver=18.2.0
pkgrel=1
pkgdesc='The standard shareable config for stylelint'
arch=('any')
url='https://github.com/stylelint/stylelint-config-standard'
license=('MIT')
depends=()
makedepends=('npm')
source=("https://registry.npmjs.org/$pkgname/-/$pkgname-$pkgver.tgz")
noextract=("$pkgname-$pkgver.tgz")
sha512sums=('d3bc744da488cef5e56ce8a8514e0e464088334ee4c88ba88e46d2542c8558d5605cc5d81df8674120a4aaefa81d625fdd80030273c65b3749e7737192827b44')

package() {
  npm install -g --prefix "$pkgdir/usr" "$srcdir/$pkgname-$pkgver.tgz"

  # For some odd reason, npm makes some directories world writeable D:
  find "$pkgdir/usr" -type d -exec chmod 755 {} +

  # Install license in the usual place
  local _npmdir="$pkgdir/usr/lib/node_modules/"
  install -Dm644 "$_npmdir/$pkgname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
