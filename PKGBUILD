# Maintainer: Igor Dyatlov <dyatlov.igor@protonmail.com>
# Contributor: Evangelos Paterakis <evan@geopjr.dev>

pkgname=collision-hashes
_app_id=dev.geopjr.Collision
pkgver=3.0.1
pkgrel=1
pkgdesc="Check hashes for your files. A simple GUI tool to generate, compare and verify MD5, SHA1 & SHA256 hashes"
arch=('x86_64')
url="https://github.com/GeopJr/Collision"
license=('BSD2')
depends=('gtk4' 'libadwaita')
makedepends=('crystal' 'gobject-introspection' 'gobject-introspection-runtime' 'shards' 'spglib')
conflicts=('hashbrown' 'collision')
source=("${url}/archive/v${pkgver}.tar.gz")
_source=Collision
b2sums=('e828750f9b1b1ea81a2235138a6a6d160f2eceb31a09a529881efcfe1724f3d7badbdf0b7f56190a24464f48b10f1c3b8637fc000041cdf21ea519996faa421c')

build() {
  cd "$_source-$pkgver"
  make all
  make metainfo
}

check() {
  cd "$_source-$pkgver"
  make test
}

package() {
	cd "$_source-$pkgver"
	make PREFIX="$pkgdir/usr" install
	
	install -Dm644 "data/$_app_id.metainfo.xml" "$pkgdir/usr/share/metainfo/$_app_id.metainfo.xml"
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  
}
