# Maintainer: Igor Dyatlov <dyatlov.igor@protonmail.com>
# Contributor: GeopJr <evan@geopjr.dev>

pkgname=hashbrown-gui
pkgver=1.2.0
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
  crystal spec
}

build() {
  cd "$_source-$pkgver"
  shards build --release --no-debug --ignore-crystal-version
}

package() {

  install -Dm755 "$_source/bin/hashbrown" "$pkgdir/usr/bin/$_pkgname"
  install -Dm644 "$_source/extra/Hashbrown.desktop" "$pkgdir/share/applications/dev.geopjr.Hashbrown.desktop"
  install -Dm644 "$_source/extra/icons/logo.svg" "$pkgdir/share/icons/hicolor/scalable/apps/dev.geopjr.Hashbrown.svg"
  gtk-update-icon-cache /usr/share/icons/hicolor
}