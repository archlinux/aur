# Maintainer: Stijn Seghers <stijnseghers at gmail dot com>

pkgname=stylelint
pkgver=13.0.0
pkgrel=1
pkgdesc='A mighty, modern linter that helps you avoid errors and enforce conventions in your styles'
arch=('any')
url='https://stylelint.io/'
license=('MIT')
depends=('nodejs')
optdepends=('stylelint-config-standard: config for common conventions')
makedepends=('npm')
source=("https://registry.npmjs.org/$pkgname/-/$pkgname-$pkgver.tgz")
noextract=("$pkgname-$pkgver.tgz")
sha256sums=('0b5447ff0fc59e04cf61aee1a085def7330018ae5f19ae0706d8bbb27258c338')

package() {
  npm install -g --prefix "$pkgdir/usr" "$srcdir/$pkgname-$pkgver.tgz"

  # For some odd reason, npm makes some directories world writeable D:
  find "$pkgdir/usr" -type d -exec chmod 755 {} +

  # Install license in the usual place
  local _npmdir="$pkgdir/usr/lib/node_modules/"
  install -Dm644 "$_npmdir/$pkgname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
