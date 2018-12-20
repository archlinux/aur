# Maintainer: Simon Legner <Simon.Legner@gmail.com>
pkgname=parcel-bundler
pkgver=1.11.0
pkgrel=1
pkgdesc="Blazing fast, zero configuration web application bundler"
arch=(any)
url="https://parceljs.org/"
license=('MIT')
depends=('nodejs')
makedepends=('npm')
options=('!strip')
source=(https://registry.npmjs.org/$pkgname/-/$pkgname-$pkgver.tgz)
noextract=($pkgname-$pkgver.tgz)

package() {
  cd $srcdir
  local _npmdir="$pkgdir/usr/lib/node_modules/"
  mkdir -p "$_npmdir"
  cd "$_npmdir"
  npm install -g --prefix "$pkgdir/usr" "$pkgname@$pkgver"
  install -Dm755 "$_npmdir/parcel-bundler/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  find "${pkgdir}"/usr -name package.json -exec sed -i '/"_where"/d' '{}' '+'
  find "${pkgdir}"/usr -type d -exec chmod 755 {} +
}

# vim:set ts=2 sw=2 et:
sha256sums=('97ca29ea47b7d55753a79c2cf1e4afcdfb24bb2f10effe6336fc30621d3eec5a')
