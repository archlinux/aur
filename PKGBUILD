# Maintainer: Igor Dyatlov <dyatlov.igor@protonmail.com>
# Contributor: Evangelos Paterakis <evan@geopjr.dev>

pkgname=collision
_app_id=dev.geopjr.Collision
pkgver=3.0.5
pkgrel=1
pkgdesc="Check hashes for your files. A simple GUI tool to generate, compare and verify MD5, SHA1 & SHA256 hashes"
arch=('x86_64')
url="https://github.com/GeopJr/Collision"
license=('BSD2')
depends=('libadwaita' 'libyaml')
makedepends=('crystal' 'gobject-introspection' 'gobject-introspection-runtime' 'shards' 'spglib')
conflicts=("$pkgname-hashes" "hashbrown")
replaces=("$pkgname-hashes" "hashbrown")
source=("${url}/archive/v${pkgver}.tar.gz")
_source=Collision
b2sums=('d35e2904b8909b517f5773a02c31f9c5493b1e834596189b4d1d791ea0218de023cfdfb39d908950b8a1afcdaed7f6586a577afe9380059e0c11823890757faa')

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
