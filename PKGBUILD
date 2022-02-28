# Maintainer: Igor Dyatlov <dyatlov.igor@protonmail.com>
# Contributor: Evangelos Paterakis <evan@geopjr.dev>

pkgname=hashbrown-git
_pkgname=hashbrown
_app_id=dev.geopjr.Hashbrown
pkgver=2.1.0.r49.g45cadce
pkgrel=1
pkgdesc="A simple GUI tool to generate, compare and verify MD5, SHA1 & SHA256 hashes"
arch=('x86_64')
url="https://github.com/GeopJr/Hashbrown"
license=('BSD2')
depends=('gtk4' 'libadwaita')
makedepends=('crystal' 'gobject-introspection' 'gobject-introspection-runtime' 'shards' 'spglib')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("git+$url.git")
_source=Hashbrown
b2sums=('SKIP')

pkgver() {
  cd "$_source"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$_source"
  
  make all
  make metainfo
  #shards build --release --no-debug
}

check() {
  cd "$_source"
  #crystal spec
  make test
}

package() {
#cd "$_source"
#make INSTALL_ROOT="$pkgdir" install
  install -Dm755 "$_source/bin/hashbrown" "$pkgdir/usr/bin/$_pkgname"
  install -Dm644 "$_source/data/$_app_id.desktop" "$pkgdir/usr/share/applications/$_app_id.desktop"
  install -Dm644 "$_source/data/icons/$_app_id.svg" "$pkgdir/usr/share/icons/hicolor/scalable/apps/$_app_id.svg"
  install -Dm644 "$_source/data/icons/$_app_id.svg" "$pkgdir/usr/share/icons/hicolor/symbolic/apps/$_app_id-symbolic.svg"
  install -Dm644 "$_source/data/$_app_id.metainfo.xml" "$pkgdir/usr/share/metainfo/$_app_id.metainfo.xml"
}
