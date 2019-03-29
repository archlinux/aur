# Maintainer: Simon Legner <Simon.Legner@gmail.com>
pkgname=geojsonhint
pkgver=3.0.0
pkgrel=1
pkgdesc="Validate and sanity-check geojson files (geojsonlint)"
arch=(any)
url="https://github.com/mapbox/geojsonhint#readme"
license=('ISC')
depends=('nodejs')
makedepends=('npm')
source=(https://registry.npmjs.org/@mapbox/$pkgname/-/$pkgname-$pkgver.tgz)
noextract=($pkgname-$pkgver.tgz)
replaces=('nodejs-geojsonhint')

package() {
  cd $srcdir
  local _npmdir="$pkgdir/usr/lib/node_modules/"
  mkdir -p $_npmdir
  cd $_npmdir
  npm install -g --prefix "$pkgdir/usr" @mapbox/$pkgname@$pkgver
  find "${pkgdir}"/usr -name package.json -exec sed -i '/"_where"/d' '{}' '+'
  find "${pkgdir}"/usr -type d -exec chmod 755 {} +
  install -Dm755 "$_npmdir/@mapbox/$pkgname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:
sha256sums=('550d2f88c6310525f9b932947e8bb8408cbffbd2e096319e5aadf85a2c5aedd5')
