# Maintainer: Simon Legner <Simon.Legner@gmail.com>
pkgname=parcel-bundler
pkgver=1.7.1
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
  cd "$pkgdir"
  rmdir usr/etc
  find -perm -o+w -exec chmod go-w '{}' '+'
  find -name package.json -exec sed -i '/"_where"/d' '{}' '+'
}

# vim:set ts=2 sw=2 et:
sha256sums=('057f7b9aa65998508b5998345df8f0130212e2d68658df886151d2ab9f481304')
