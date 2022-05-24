# Maintainer: Igor Dyatlov <dyatlov.igor@protonmail.com>
# Contributor: Evangelos Paterakis <evan@geopjr.dev>

pkgname=collision-hashes
_app_id=dev.geopjr.Collision
pkgver=3.0.3
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
b2sums=('725e1d26dde623ec14b02a102d849cbb7289f4f6e6dfbb6b356690638b2f1a073722f0e7257828b53c7eb4b42bfce3b3264cc45adfa1b3d5e2d1cf1ae31665bc')

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
