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
  crystal spec
}

build() {
  cd "$_source"
  shards build --release --no-debug --ignore-crystal-version
}

package() {

  install -Dm755 "$_source/bin/hashbrown" "$pkgdir/usr/bin/$_pkgname"
  install -Dm644 "$_source/extra/Hashbrown.desktop" "$pkgdir/share/applications/dev.geopjr.Hashbrown.desktop"
  install -Dm644 "$_source/extra/icons/logo.svg" "$pkgdir/share/icons/hicolor/scalable/apps/dev.geopjr.Hashbrown.svg"
  gtk-update-icon-cache /usr/share/icons/hicolor
}
