# Maintainer: Stijn Seghers <stijnseghers at gmail dot com>

pkgname=stylelint
pkgver=10.1.0
pkgrel=1
pkgdesc='A mighty, modern CSS linter that helps you enforce consistent conventions and avoid errors in your stylesheets'
arch=('any')
url='https://stylelint.io/'
license=('MIT')
depends=('nodejs')
optdepends=('stylelint-config-standard')
makedepends=('npm')
source=("https://registry.npmjs.org/$pkgname/-/$pkgname-$pkgver.tgz")
noextract=("$pkgname-$pkgver.tgz")
sha512sums=('3a69545eb83310c2d0623d493d3a7264f47d1b86e5d12b6275f1e718910ca5d890d09c93ab430f835c641e4d7fc55276ad33c44b22420d68c6f0a6e9a28ecabb')

package() {
  npm install -g --prefix "$pkgdir/usr" "$srcdir/$pkgname-$pkgver.tgz"

  # For some odd reason, npm makes some directories world writeable D:
  find "$pkgdir/usr" -type d -exec chmod 755 {} +

  # Install license in the usual place
  local _npmdir="$pkgdir/usr/lib/node_modules/"
  install -Dm644 "$_npmdir/$pkgname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
