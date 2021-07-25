# Maintainer: Igor Dyatlov <dyatlov.igor@protonmail.com>
# Contributor: Evangelos Paterakis <evan@geopjr.dev>

pkgname=hashbrown-gui
pkgver=1.3.2
pkgrel=1
pkgdesc="A simple GUI tool to generate, compare and verify MD5, SHA1 & SHA256 hashes"
arch=('x86_64')
url="https://github.com/GeopJr/Hashbrown"
license=('AGPL3')
depends=('gtk3')
makedepends=('crystal' 'gobject-introspection' 'gobject-introspection-runtime' 'shards' 'spglib')
provides=("${pkgname}-git")
conflicts=("${pkgname}-git")
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
_source=Hashbrown
sha256sums=('SKIP')

check() {
  cd "$_source-$pkgver"
  crystal spec
}

build() {
  cd "$_source-$pkgver"
  shards build --release --no-debug --ignore-crystal-version
}

package() {
  install -Dm755 "$_source-$pkgver/bin/hashbrown" "$pkgdir/usr/bin/$pkgname"
  install -Dm644 "$_source-$pkgver/extra/Hashbrown.desktop" "$pkgdir/usr/share/applications/dev.geopjr.Hashbrown.desktop"
  install -Dm644 "$_source-$pkgver/extra/icons/logo.svg" "$pkgdir/usr/share/icons/hicolor/scalable/apps/dev.geopjr.Hashbrown.svg"
  install -Dm644 "$_source-$pkgver/extra/icons/symbolic.svg" "$pkgdir/usr/share/icons/hicolor/symbolic/apps/dev.geopjr.Hashbrown-symbolic.svg"
  install -Dm644 "$_source-$pkgver/extra/dev.geopjr.Hashbrown.metainfo.xml" "$pkgdir/usr/share/metainfo/dev.geopjr.Hashbrown.metainfo.xml"
  gtk-update-icon-cache /usr/share/icons/hicolor
}