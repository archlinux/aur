# Maintainer: Igor Dyatlov <dyatlov.igor@protonmail.com>
# Contributor: Evangelos Paterakis <evan@geopjr.dev>

pkgname=collision-hashes
_app_id=dev.geopjr.Collision
pkgver=3.0.2
pkgrel=1
pkgdesc="Check hashes for your files. A simple GUI tool to generate, compare and verify MD5, SHA1 & SHA256 hashes"
arch=('x86_64')
url="https://github.com/GeopJr/Collision"
license=('BSD2')
depends=('libadwaita')
makedepends=('crystal' 'gobject-introspection' 'gobject-introspection-runtime' 'shards' 'spglib')
conflicts=('hashbrown' 'collision')
source=("${url}/archive/v${pkgver}.tar.gz")
_source=Collision
b2sums=('2c91f0829e9de8b9f328d9664f75341d47e2a7740cfa57af1470fc91f3b2848af5d468ce25fe500bf242c21303a61bab179158153328335d1a0cf93346d13de2')

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
