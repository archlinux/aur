# Maintainer: Igor Dyatlov <dyatlov.igor@protonmail.com>
# Contributor: GeopJr <evan@geopjr.dev>

pkgname=hashbrown-gui-git
_pkgname=hashbrown-gui
pkgver=v1.2.0.r8.g60181b3
pkgrel=1
pkgdesc="A simple GUI tool to generate, compare and verify MD5, SHA1 & SHA256 hashes"
arch=('x86_64')
url="https://github.com/GeopJr/Hashbrown"
license=('AGPL3')
depends=('gtk3')
makedepends=('crystal' 'gobject-introspection' 'gobject-introspection-runtime' 'shards' 'spglib')
provides=("${_pkgname%}")
conflicts=("${_pkgname%}")
source=("git+$url.git")
_source=Hashbrown
sha256sums=('SKIP')

pkgver() {
  cd "$_source"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

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