
# Maintainer: Stijn Seghers <stijnseghers at gmail dot com>

pkgname=stylelint-config-standard
pkgver=18.3.0
pkgrel=1
pkgdesc='The standard shareable config for stylelint'
arch=('any')
url='https://github.com/stylelint/stylelint-config-standard'
license=('MIT')
depends=()
makedepends=('npm')
source=("https://registry.npmjs.org/$pkgname/-/$pkgname-$pkgver.tgz")
noextract=("$pkgname-$pkgver.tgz")
sha512sums=('4dd73f4c579d7638f2eb82ef8cf6aef52b1f5517b199316a5219cc06bcf3d3b278a7675542d9a99dc445fe8f32667f2e800dd4b78dc4ea8d46b635fcd13172b7')

package() {
  npm install -g --prefix "$pkgdir/usr" "$srcdir/$pkgname-$pkgver.tgz"

  # For some odd reason, npm makes some directories world writeable D:
  find "$pkgdir/usr" -type d -exec chmod 755 {} +

  # Install license in the usual place
  local _npmdir="$pkgdir/usr/lib/node_modules/"
  install -Dm644 "$_npmdir/$pkgname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
