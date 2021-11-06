# Maintainer: Igor Dyatlov <dyatlov.igor@protonmail.com>
# Contributor: Evangelos Paterakis <evan@geopjr.dev>

pkgname=hashbrown
_pkgname=hashbrown
_app_id=dev.geopjr.Hashbrown
pkgver=2.1.0
pkgrel=1
pkgdesc="A simple GUI tool to generate, compare and verify MD5, SHA1 & SHA256 hashes"
arch=('x86_64')
url="https://github.com/GeopJr/Hashbrown"
license=('AGPL3')
depends=('gtk4' 'libadwaita')
makedepends=('crystal' 'gobject-introspection' 'gobject-introspection-runtime' 'shards' 'spglib')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
_source=Hashbrown
sha512sums=('bd2cd0f5dcdf5add34e3a5a3116891cbd6dbdf07a32883debee42460191bca0527950e7221f936bc3b87a52db3faa1a4f778eb4d22f988e1be840d4c50b79c7e')

build() {
  cd "$_source-$pkgver"
  shards build --release --no-debug
}

check() {
  cd "$_source-$pkgver"
  crystal spec
}

package() {
  install -Dm755 "$_source-$pkgver/bin/hashbrown" "$pkgdir/usr/bin/$pkgname"
  install -Dm644 "$_source-$pkgver/extra/Hashbrown.desktop" "$pkgdir/usr/share/applications/$_app_id.desktop"
  install -Dm644 "$_source-$pkgver/extra/icons/logo.svg" "$pkgdir/usr/share/icons/hicolor/scalable/apps/$_app_id.svg"
  install -Dm644 "$_source-$pkgver/extra/icons/symbolic.svg" "$pkgdir/usr/share/icons/hicolor/symbolic/apps/$_app_id-symbolic.svg"
  install -Dm644 "$_source-$pkgver/extra/dev.geopjr.Hashbrown.metainfo.xml" "$pkgdir/usr/share/metainfo/$_app_id.metainfo.xml"
}
